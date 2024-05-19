package cn.pqz.salary.service;

import cn.pqz.salary.contract.BaiduBlockChain;
import cn.pqz.salary.contract.EmployeeService;
import cn.pqz.salary.DTO.UserDTO;
import cn.pqz.salary.entity.User;
import cn.pqz.salary.entity.UserContract;
import cn.pqz.salary.mapper.UserContractMapper;
import cn.pqz.salary.mapper.UserMapper;
import com.baidu.xuper.api.Account;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.joda.time.DateTime;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
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
    @SneakyThrows
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.loadUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("账户不存在");
        }
        if (StringUtils.isNotBlank(user.getUserface())) {
            user.setUserface(pngToBase64(user.getUserface()));
        }
        user.setRoles(userMapper.getUserRolesByUid(user.getId()));
        return user;
    }

    public String pngToBase64(String name) throws IOException {
        Path path = new File(new File("static/").getAbsolutePath() + "/" + name + ".jpeg").toPath();
        byte[] bytes = Files.readAllBytes(path);
        return "data:image/jpeg;base64," +  Base64.getEncoder().encodeToString(bytes);
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
        employeeService.addEmployee(account);
    }

    public void updateContract(Account account, User user, UserContract userContract) {
        String address = employeeService.getAddress(account);
        log.info("user {} contract address is {}", user.getId(), address);
        if (!userContract.getContractAddress().equals(address)){
            userContract.setContractAddress(address);
            userContractMapper.updateById(userContract);
        }
        employeeService.addEmployee(account);
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
