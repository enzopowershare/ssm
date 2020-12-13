package com.enzo.service;

import java.util.List;
import java.util.Map;

/**
 * @author : Enzo
 * @version : 1.0
 * @date : Created on 2020/12/12 16:40
 * @description :
 * @modifiedBy :
 */
public interface PersonService {
    List<Map<String, Object>> findAllPerson();

    List<Map<String, Object>> findAllPersonPage(Map map);

    List<Map<String, Object>> findAllArea();

    Map<String, Object> findPersonById(String personId);

    void insertPersonInfo(String insertPersonName, String insertPersonAreaId, String insertPersonAge, String insertPersonAddress);

    void deletePersonById(int personId);

    void updatePersonInfo(String updatePersonId, String updatePersonName, String updatePersonAreaId, String updatePersonAge, String updatePersonAddress);

    long getRowCount();
}
