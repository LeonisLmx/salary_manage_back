package cn.pqz.emsboot.modules.sys.service;

import cn.pqz.emsboot.contract.BaiduBlockChain;
import cn.pqz.emsboot.contract.LocalBaiduBlockChain;
import cn.pqz.emsboot.contract.EmployeeService;
import cn.pqz.emsboot.contract.RemoteBaiduBlockChain;
import cn.pqz.emsboot.modules.sys.DTO.UserDTO;
import cn.pqz.emsboot.modules.sys.entity.User;
import cn.pqz.emsboot.modules.sys.entity.UserContract;
import cn.pqz.emsboot.modules.sys.mapper.UserContractMapper;
import cn.pqz.emsboot.modules.sys.mapper.UserMapper;
import com.baidu.xuper.api.Account;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
@Transactional
public class UserService extends ServiceImpl<UserMapper,User> implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;

    @Resource
    private UserContractMapper userContractMapper;

    @Autowired
    private BaiduBlockChain baiduBlockChain;

    @Resource
    private EmployeeService employeeService;

    /**
     * @param username
     * @return 用户信息及其拥有的权限
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.loadUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("账户不存在");
        }
        user.setRoles(userMapper.getUserRolesByUid(user.getId()));
        return user;
    }

    /**
     * 分页查询
     *
     * @param pageNum 当前页数
     * @param size 当前页有多少条数据
     * @return
     */
    public List<UserDTO> userList(Integer pageNum, Integer size, String query) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("username", query);
        IPage<User> page = userMapper.selectPage(new Page<>(pageNum, size), queryWrapper);
        List<UserDTO> list = new ArrayList<>();
        for (User record : page.getRecords()) {
            UserDTO userDTO = new UserDTO();
            BeanUtils.copyProperties(record, userDTO);
            userDTO.setWorkInCompanyTime(record.getCreateTime().getTime());
            userDTO.setWorkInCompanyDays((System.currentTimeMillis() - record.getCreateTime().getTime()) / DateUtils.MILLIS_PER_DAY);
            userDTO.setId(record.getId().longValue());
            list.add(userDTO);
        }
        return list;
    }

    /**
     * 添加用户
     * @param user 用户主体
     * @return 操作多少条数据
     */
    public Integer addUser(User user) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String pawd = encoder.encode(user.getPassword());
        user.setPassword(pawd);
        int i = userMapper.insert(user);
        User entity = userMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getPhone, user.getPhone()));
        Account account = Account.create(1, 2);
        addToContract(account, entity);
        return i;
    }

    public void addToContract(Account account, User user) {
        UserContract userContract = new UserContract();
        userContract.setUserId(user.getId().longValue());
        userContract.setMnemonic(account.getMnemonic());
        userContract.setAddress(account.getAddress());
        employeeService.transfer(userContract.getAddress());
        userContract.setContractName(baiduBlockChain.createContractAddress());
        userContract.setContractAddress(employeeService.getAddress(account));
        userContractMapper.insert(userContract);
        employeeService.addEmployee(account, user.getSalary().longValue(), user.getPayDuration());
    }

    public void updateContract(Account account, User user, UserContract userContract) {
//        try {
//            baiduBlockChain.createContractAddressByName(userContract.getContractName());
//        }catch (Exception e){
//            log.error("create contract error by e:",e);
//        }
        String address = employeeService.getAddress(account);
        log.info("user {} contract address is {}", user.getId(), address);
        if (!userContract.getContractAddress().equals(address)){
            userContract.setContractAddress(address);
            userContractMapper.updateById(userContract);
        }
        employeeService.addEmployee(account, user.getSalary().longValue(), user.getPayDuration());
    }

    public List<UserDTO> userSalary(Integer pageNum, Integer size, String query) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotBlank(query)) {
            queryWrapper.eq("id", Integer.parseInt(query));
        }
        IPage<User> page = userMapper.selectPage(new Page<>(pageNum, size), queryWrapper);
        List<UserDTO> list = new ArrayList<>();
        for (User record : page.getRecords()) {
            UserDTO userDTO = new UserDTO();
            BeanUtils.copyProperties(record, userDTO);
            userDTO.setWorkInCompanyTime(record.getCreateTime().getTime());
            userDTO.setWorkInCompanyDays((System.currentTimeMillis() - record.getCreateTime().getTime()) / DateUtils.MILLIS_PER_DAY);
            userDTO.setId(record.getId().longValue());
            userDTO.setNextPayTime(record.getLastPayTime().getTime() + TimeUnit.DAYS.toMillis(record.getPayDuration()));
            if (record.getId() == 1){
                userDTO.setBalance(employeeService.getTotalBalance());
            }else {
                userDTO.setBalance(employeeService.getBalance(record.getId().longValue()));
            }
            list.add(userDTO);
        }
        return list;
    }
}
