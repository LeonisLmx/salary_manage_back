package cn.pqz.emsboot.modules.sys.entity;

import lombok.Data;

/**
 * @author urey.liu
 * @date 2024/5/7 1:16 PM
 */
@Data
public class UserContract {

    private Long id;

    private Long userId;

    private String mnemonic;

    private String address;

    private String contractName;

    private String contractAddress;
}
