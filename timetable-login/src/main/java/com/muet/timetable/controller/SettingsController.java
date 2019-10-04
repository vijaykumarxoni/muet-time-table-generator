package com.muet.timetable.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.User;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;


@Controller
@RequestMapping("/settings")
public class SettingsController {
	
	
	@Autowired
	UserDAOImpl userDAOImpl;

	@Autowired
	BatchDAOImpl batchDAOImpl;
	

	@Autowired
	SemesterDAOImpl semesterDAOImpl;

	
	@RequestMapping("")
	public String DayPage(Model model,Principal principal) {
		
		User user = userDAOImpl.findByUsername(principal.getName());
		
		
		//For Side bar
		List<Batch> batchs = batchDAOImpl.getAllRecordsByDept(user.getDepartment());
    	List<Semester> semesters = semesterDAOImpl.getAllRecords();
     	model.addAttribute("batchs",batchs);
    	model.addAttribute("semesters",semesters);
    	//
		
		return "settings-page";
	}
}
