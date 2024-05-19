package cn.pqz.salary.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class MenuRole implements Serializable {

    private Integer id;
    private Integer rid;
    private Integer mid;
}
