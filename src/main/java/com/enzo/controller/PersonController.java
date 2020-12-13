package com.enzo.controller;

import com.enzo.entity.ReturnBean;
import com.enzo.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author : Enzo
 * @version : 1.0
 * @date : Created on 2020/12/12 16:47
 * @description :
 * @modifiedBy :
 */
@Controller
public class PersonController {
    @Autowired
    private PersonService personService;
    @Autowired
    private ReturnBean returnBean;

    @RequestMapping("/findAllPersonPage")
    @ResponseBody
    public ReturnBean findAllPersonPage(int page, int limit) {
        Map map = new HashMap();
        int start = (page - 1) * limit;
        map.put("start", start);
        map.put("limit", limit);
        final List<Map<String, Object>> allPersonPage = personService.findAllPersonPage(map);
        final long rowCount = personService.getRowCount();
        returnBean.setCode(0);
        returnBean.setData(allPersonPage);
        returnBean.setCount((int) rowCount);
        return returnBean;
    }

    @RequestMapping("/findAllArea")
    public List<Map<String, Object>> findAllArea() {
        return personService.findAllArea();
    }

    @RequestMapping("/findPersonById")
    public Map<String, Object> findPersonById(String personId) {
        return personService.findPersonById(personId);
    }

    @RequestMapping("/insertPersonInfo")
    public String insertPersonInfo(String insertPersonName, String insertPersonAreaId, String insertPersonAge, String insertPersonAddress) {
        personService.insertPersonInfo(insertPersonName, insertPersonAreaId, insertPersonAge, insertPersonAddress);
        return "redirect:/";
    }

    @RequestMapping("/deletePersonById")
    public void deletePersonById(int personId) {
        personService.deletePersonById(personId);
    }

    @RequestMapping("/updatePersonInfo")
    public String updatePersonInfo(String updatePersonId, String updatePersonName, String updatePersonAreaId, String updatePersonAge, String updatePersonAddress) {
        personService.updatePersonInfo(updatePersonId, updatePersonName, updatePersonAreaId, updatePersonAge, updatePersonAddress);
        return "redirect:/";
    }

}
