package com.muet.timetable.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;

@Controller
@RequestMapping("/semester")

public class SemesterController {

	@Autowired
	SemesterDAOImpl semesterDAOImpl;

	@RequestMapping("")
	public String DayPage(Model modele) {
		return "semester-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		return ResponseEntity.ok(semesterDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		
		return ResponseEntity.ok(semesterDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println(semesterDAOImpl.getRecordById(batch.getId()).toString());
		return ResponseEntity.ok(semesterDAOImpl.getRecordById(batch.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Semester semester, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		Date date3 = Calendar.getInstance().getTime();
	    SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");

	    java.sql.Date date = null;

	    try {
	        date =new java.sql.Date(df.parse(df.format(date3)).getTime());
	        System.out.println(date);
	    } catch (ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
		
		semester.setCreatedAt(date);
		semester.setUpdatedAt(date);
		semester.setCreatedBy(0);
		semester.setUpdatedBy(0);
		semester.setActive(1);
		semesterDAOImpl.addRecord(semester);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Semester semester, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Semester updatedsemester = semesterDAOImpl.getRecordById(semester.getId());
		updatedsemester.setName(semester.getName());
		semesterDAOImpl.updateRecord(updatedsemester);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Semester semester, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Semester deletedsemester = semesterDAOImpl.getRecordById(semester.getId());
		semesterDAOImpl.deleteRecord(deletedsemester);
		return ResponseEntity.ok("OK");

	}

}
