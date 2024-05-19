package cn.pqz.salary.DTO;

import cn.pqz.salary.entity.UserSalaryDetail;
import lombok.Data;

/**
 * @author urey.liu
 * @date 2024/5/10 8:07 PM
 */
@Data
public class UserSalaryDetailDTO extends UserSalaryDetail {

    private String name;
}
