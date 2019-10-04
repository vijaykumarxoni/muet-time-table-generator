package com.muet.timetable.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.DaySlot;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;

@Controller
@RequestMapping("/timetable")
public class TimeTableGenerator {
	
	
	@Autowired
	SubjectDAOImpl subjectDAOImpl; 
	
	@Autowired
	TimeSlotDailyDAOImpl timeSlotDailyDAOImpl;
	

	@Autowired
	DayDAOImpl dayDAOImpl;
	
	@Autowired
	AssignSubject assignSubject;
	
	@Autowired
	AssignSubjectDAOImpl assignSubjectDAOImpl;
	
	
	
	
	@RequestMapping(value="",method = RequestMethod.GET)
	public String getData(Model model,@ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		
		System.out.println("batch: "+assignsubject.getBatch());
		System.out.println("section: "+assignsubject.getSection());
		System.out.println("semester: "+assignsubject.getSemester().getName());
		
		
		model.addAttribute("listofteachers", assignSubjectDAOImpl.getAllRecordsByBatchAndSectionAndSemester(assignsubject.getBatch(), assignsubject.getSection(),assignsubject.getSemester()));
		
	//	assignSubject.setBatch(batch);
		
//		return ResponseEntity.ok(assignsubjectDAOImpl.getAllRecordsByBatchAndSection(assignsubject.getBatch(), assignsubject.getSection()));
		
		return "timetable-page";
	}

	
	
	
	
	 

	
	
	
}
