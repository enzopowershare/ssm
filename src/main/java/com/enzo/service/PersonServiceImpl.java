package com.enzo.service;

import com.enzo.dao.PersonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author : Enzo
 * @version : 1.0
 * @date : Created on 2020/12/12 16:41
 * @description :
 * @modifiedBy :
 */
@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonDao personDao;

    @Override
    public List<Map<String, Object>> findAllPerson() {
        return personDao.findAllPerson();
    }

    @Override
    public List<Map<String, Object>> findAllPersonPage(Map map) {
        return personDao.findAllPersonPage(map);
    }

    @Override
    public List<Map<String, Object>> findAllArea() {
        return personDao.findAllArea();
    }

    @Override
    public Map<String, Object> findPersonById(String personId) {
        return personDao.findPersonById(personId);
    }

    @Override
    public void insertPersonInfo(String insertPersonName, String insertPersonAreaId, String insertPersonAge, String insertPersonAddress) {
        personDao.insertPersonInfo(insertPersonName, insertPersonAreaId, insertPersonAge, insertPersonAddress);
    }

    @Override
    public void deletePersonById(int personId) {
        personDao.deletePersonById(personId);
    }

    @Override
    public void updatePersonInfo(String updatePersonId, String updatePersonName, String updatePersonAreaId, String updatePersonAge, String updatePersonAddress) {
        personDao.updatePersonInfo(updatePersonId, updatePersonName, updatePersonAreaId, updatePersonAge, updatePersonAddress);
    }

    @Override
    public long getRowCount() {
        return personDao.getRowCount();
    }
}
