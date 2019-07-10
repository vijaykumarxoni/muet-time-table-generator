package com.muet.timetable.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.User;
import com.muet.timetable.dao.SecurityDAO;
import com.muet.timetable.dao.UserDAO;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.validator.UserValidator;

@Controller
public class UserController {
	
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private SecurityDAO securityDAO;

    @Autowired
    private UserValidator userValidator;

    
    @Autowired
    private DepartmentDAOImpl departmentDAOImpl;

    
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        List<Department>  dept= departmentDAOImpl.getAllRecords();
       
        
        model.addAttribute("departmentList" ,dept);
        

        return "registration-page";
    }


    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration-page";
        }

        userDAO.save(userForm);
        System.out.println("Login By Xoni");

        securityDAO.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/dashboard";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
    	
        System.out.println("Login By Soni /Login ");

        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        
        
        return "login-page";
    }

    @GetMapping({"/", "/dashboard"})
    public String welcome(Model model,Principal principal) {
    
    	User user=userDAO.findByUsername(principal.getName());
         String role=user.getAdminRole();  
   
    if(role.equalsIgnoreCase("Admin")) {	
        return "dashboard";}
    else if (role.equalsIgnoreCase("Teacher")) {
    return "teacherdashboard-page";}
    
    return "dashboard";
    }
}
