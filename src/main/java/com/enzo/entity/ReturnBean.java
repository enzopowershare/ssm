package com.enzo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.Entity;

/**
 * @author : Enzo
 * @version : 1.0
 * @date : Created on 2020/12/11 16:26
 * @description :
 * @modifiedBy :
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class ReturnBean {
    /**
     * code : 0
     * msg :
     * count : 1000
     * data : [{"id":10000,"username":"user-0","score":27}]
     */
    private int code;
    private String msg;
    private int count;
    private Object data;
}
