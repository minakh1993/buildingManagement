package com.websystique.springmvc.controller;


import com.websystique.springmvc.User.Employee;
import com.websystique.springmvc.User.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class HomeController {


    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loginpage(Model model){

        model.addAttribute("employee", new Employee());
        return "Login";
    }

    @RequestMapping(value = "/" , method = RequestMethod.POST)
    public String login(@Valid Employee emp, Model model, BindingResult result, HttpSession httpSession){

        System.out.println(emp);
        //if error occurred while sending data
        if (result.hasErrors()){

            return "Login";
        }

        //getting the real password from database
        Employee employee =employeeService.findById(emp.getUsername());
        //if no password were recorded in database
        if(employee.getPassword()==null){
            Employee emp1=new Employee();
            emp1.setUsername(employee.getUsername());
            model.addAttribute("employee", emp1);
            return "Login";
        }


        if(employee.getPassword().equalsIgnoreCase(emp.getPassword())){
            httpSession.setAttribute("loginInformation", employee);

            return "redirect:/schedule/";
        }else{
            Employee emp1=new Employee();
            emp1.setUsername(employee.getUsername());
            model.addAttribute("employee", emp1);
            return "Login";
        }


    }

    @RequestMapping(value = "/navBar", method = RequestMethod.GET)
    public String returnNavBar(){
        return "navBar";
    }



    /*public void test(){
        System.out.println(eventService.getEmployeeEvents("mina", 2018));
    }*/

//    @RequestMapping(value = "/testAutoComplete", method = RequestMethod.GET)
//    public String getTest(){
//        return "testingAutoComplete";
//    }



}
