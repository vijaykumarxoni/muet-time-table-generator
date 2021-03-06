package com.muet.timetable.controller;


import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.RequestSlots;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Sidebar;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.beans.User;
import com.muet.timetable.dao.SecurityDAO;
import com.muet.timetable.dao.TeacherDAO;
import com.muet.timetable.dao.UserDAO;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.NotificationDetailsDAOImpl;
import com.muet.timetable.daoImpl.RequestSlotsDAOImpl;
import com.muet.timetable.daoImpl.SectionDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.TeacherDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;
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
    
    @Autowired
    private BatchDAOImpl batchDAOImpl;
    
    
    @Autowired
    private AssignSubjectDAOImpl assignSubjectDAO;
    
    @Autowired
    private TeacherDAOImpl teacherDAOImpl;
    
    @Autowired
    private UserDAOImpl userDAOImpl;
    
    @Autowired
    private RequestSlotsDAOImpl requestSlotsDAOImpl;
    
    
    
    @Autowired
    private SectionDAOImpl sectionDAOImpl;
    
    @Autowired
    private SemesterDAOImpl semesterDAOImpl;
    
    @Autowired
    private Sidebar sidebar;
    
    @Autowired
    private NotificationDetailsDAOImpl notificationDetailsDAOImpl;
    
    
    

    
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
    public String  welcome(Model model,Principal principal) {
    	User user=userDAO.findByUsername(principal.getName());
         String role=user.getAdminRole();
         
         
   
    if(role.equalsIgnoreCase("Admin")) {
    	
    	List<Batch> batchs = batchDAOImpl.getAllRecordsByDept(user.getDepartment());
    	List<Semester> semesters = semesterDAOImpl.getAllRecords();
    	List <AssignSubject> assignSubjects = assignSubjectDAO.getAllRecordsByDepartment(user.getDepartment());
    	List<Teacher> teachers=teacherDAOImpl.getAllRecordsByDepartment(user.getDepartment());
    	
    	
    //	List<Section> sections = sectionDAOImpl.getAllRecordsByBatch(batch);
    	
    	
    	
    	
    	
    	//model.addAttribute("dept_id",user.getDepartment().getId());
    	model.addAttribute("user",user);
    	model.addAttribute("mylist",sidebar.getMyList());
    	model.addAttribute("batchs",batchs);
    	model.addAttribute("semesters",semesters);
    	model.addAttribute("assignsubjects",assignSubjects);
    	model.addAttribute("teachers",teachers);
     	model.addAttribute("admin_id",user.getId());
    	
    	
        return "dashboard";}
    else if (role.equalsIgnoreCase("Teacher")) {
         List<AssignSubject> asList=assignSubjectDAO.getAllRecordsByTeacher(user.getTeacher());
         List<NotificationDetails> notificationDetails=notificationDetailsDAOImpl.getNotificationByAssignSubject(asList.get(0));
         List<RequestSlots> requestSlots=requestSlotsDAOImpl.getAllRecordsByUser(user);
         if(asList.size()!=0) {
    	model.addAttribute("assign_subjects",asList);
    	model.addAttribute("notificationDetails",notificationDetails);
    	model.addAttribute("requestSlots",requestSlots);
    	model.addAttribute("admin_id",user.getId());
    	
    	
         }
         
         return "teacher-dashboard-page";
    
    }
    else if (role.equalsIgnoreCase("SuperAdmin")) {
    	
    	//model.addAttribute("dept_admin", userDAOImpl.getAllRecords());
    	
    	 return "super-dashboard-page";
    	
    }
    
    return "dashboard";
    }
}
