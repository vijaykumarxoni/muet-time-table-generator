package com.muet.timetable.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;

@Controller
@RequestMapping("/teacherdashboard")
public class TeacherDashboardController {
	
	
	
	
	@RequestMapping("")
	public String DayPage(Model modele) {
		
		return "teacherdashboard-page";
	}

//	@PostMapping("/getall")
//	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
//		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
//		
//		return ResponseEntity.ok(batchDAOImpl.getAllRecords(pageable));
//
//	}
//	
//	@PostMapping("/getList")
//	public ResponseEntity<?> getList() {
//		ModelAndView model = new ModelAndView("batch-page");
//		return ResponseEntity.ok(batchDAOImpl.getAllRecords());
//
//	}
//
//	@PostMapping("/get")
//	public ResponseEntity<?> getOne(@ModelAttribute Batch batch, BindingResult bindingResult,
//			HttpServletRequest httpServletRequest) {
//
//		System.out.println(batchDAOImpl.getRecordById(batch.getId()).toString());
//		return ResponseEntity.ok(batchDAOImpl.getRecordById(batch.getId()));
//
//	}


	
}
