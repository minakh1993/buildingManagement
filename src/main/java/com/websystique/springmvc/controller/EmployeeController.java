package com.websystique.springmvc.controller;


import com.websystique.springmvc.User.Employee;
import com.websystique.springmvc.User.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@Controller
@RequestMapping("/Employee")
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/findEmployee")
    @ResponseBody
    public String findEmployees(@RequestParam("q")  String text){


        System.out.println("text:"+text);
        Set<Employee> returnedEmployees =employeeService.findEmployeesByFamily(text);
        String result= returnedEmployees.toString();
        System.out.println(result);
        return result;
    }

    @RequestMapping("/")
    public String getFindPage(){
        return "SimpleEmployeeSearch";
    }





}
