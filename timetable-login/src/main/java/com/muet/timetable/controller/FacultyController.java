package com.muet.timetable.controller;

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

import com.muet.timetable.beans.Faculty;
import com.muet.timetable.daoImpl.FacultyDAOImpl;

@Controller
@RequestMapping("/faculty")

public class FacultyController {

	@Autowired
	FacultyDAOImpl facultyDAOImpl;
//	

//	 

	@RequestMapping("")
	public String facultyPage(Model modele) {
		System.out.println(facultyDAOImpl.getAllRecords().get(0).getCreatedBy());
		return "faculty-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.DESC, "id");
		return ResponseEntity.ok(facultyDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(facultyDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Faculty faculty, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println(facultyDAOImpl.getRecordById(faculty.getId()).toString());
		return ResponseEntity.ok(facultyDAOImpl.getRecordById(faculty.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Faculty faculty, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		faculty.setActive(1);
		facultyDAOImpl.addRecord(faculty);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Faculty faculty, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		System.out.println(faculty.toString());
		Faculty updatedFaculty = facultyDAOImpl.getRecordById(faculty.getId());
		updatedFaculty.setName(faculty.getName());
		facultyDAOImpl.updateRecord(updatedFaculty);

		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Faculty faculty, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Faculty deletedFaculty = facultyDAOImpl.getRecordById(faculty.getId());
		facultyDAOImpl.deleteRecord(deletedFaculty);
		return ResponseEntity.ok("OK");

	}

}
