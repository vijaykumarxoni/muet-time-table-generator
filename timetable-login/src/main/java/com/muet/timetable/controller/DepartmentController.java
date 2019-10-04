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

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.FacultyDAOImpl;;

@Controller
@RequestMapping("/department")

public class DepartmentController {

	@Autowired
	DepartmentDAOImpl departmentDAOImpl;
	

	@Autowired
	FacultyDAOImpl facultyDAOImpl;
//	

//	 

	@RequestMapping("")
	public String DepartmentPage(Model modele) {

		return "dept-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 10, Direction.DESC, "id");
		return ResponseEntity.ok(departmentDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(departmentDAOImpl.getAllRecords());

	}
	
	@PostMapping("/getTotalAdmin")
	public ResponseEntity<?> getTotalAdmin() {
		return ResponseEntity.ok(departmentDAOImpl.getAllRecords().size());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Department department, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(departmentDAOImpl.getRecordById(department.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Department department, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		department.setActive(1);
		departmentDAOImpl.addRecord(department);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Department department, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Department updatedDepartment = departmentDAOImpl.getRecordById(department.getId());
		System.out.println(department.toString());
		updatedDepartment.setName(department.getName());
		updatedDepartment.setCode(department.getCode());
		
		Faculty faculty =facultyDAOImpl.getRecordById(department.getFaculty().getId());
		updatedDepartment.setFaculty(faculty);

		departmentDAOImpl.updateRecord(updatedDepartment);

		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Department department, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Department deletedDepartment = departmentDAOImpl.getRecordById(department.getId());
		departmentDAOImpl.deleteRecord(deletedDepartment);
		return ResponseEntity.ok("OK");

	}

}
