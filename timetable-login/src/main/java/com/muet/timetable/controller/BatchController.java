package com.muet.timetable.controller;

import java.security.Principal;
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
import com.muet.timetable.beans.User;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;

@Controller
@RequestMapping("/batch")

public class BatchController {

	@Autowired
	BatchDAOImpl batchDAOImpl;

	@Autowired
	UserDAOImpl userDAO;

	
	@Autowired
	DepartmentDAOImpl deptDAOImpl;

	@Autowired
	SemesterDAOImpl semesterDAOImpl;
	
	@RequestMapping("")
	public String DayPage(Model modele) {
		
		return "batch-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page,Principal principal) {
		Pageable pageable = new PageRequest(page, 10, Direction.ASC, "id");
		Department department=userDAO.findByUsername(principal.getName()).getDepartment();
        
		return ResponseEntity.ok(batchDAOImpl.getAllRecords(department,pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList(@RequestParam(name = "deptId") long  deptId) {
		return ResponseEntity.ok(batchDAOImpl.getAllRecordsByDept(deptDAOImpl.getRecordById(deptId)));

	}
	
	
	
	
	
	@PostMapping("/getListByDept")
	public ResponseEntity<?> getListByDepartment(Principal principal) {
		User user=userDAO.findByUsername(principal.getName());
		Department department=deptDAOImpl.getRecordById(user.getDepartment().getId());
		return ResponseEntity.ok(batchDAOImpl.getAllRecordsByDept(department));

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		return ResponseEntity.ok(batchDAOImpl.getRecordById(batch.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest,Principal principal) {
		
		Department department = userDAO.findByUsername(principal.getName()).getDepartment();
		
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
	    batch.setDept(department);
	    batch.setCreatedAt(date);
	    batch.setUpdatedAt(date);
	    batch.setCreatedBy(0);
	    batch.setUpdatedBy(0);
	    batch.setActive(1);
		batchDAOImpl.addRecord(batch);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest,Principal principal) {
		Batch updatedbatch = batchDAOImpl.getRecordById(batch.getId());
		Semester updatedsemester =semesterDAOImpl.getRecordById(batch.getCurrentSemester().getId());
		//System.out.println("batch.getCurrentSemester(): "+batch.getCurrentSemester().getId());
		
		updatedbatch.setName(batch.getName());
		updatedbatch.setYear(batch.getYear());
		updatedbatch.setCurrentSemester(updatedsemester);
		Department department = userDAO.findByUsername(principal.getName()).getDepartment();
         updatedbatch.setDept(department);
		batchDAOImpl.updateRecord(updatedbatch);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Batch deletedbatch = batchDAOImpl.getRecordById(batch.getId());
		batchDAOImpl.deleteRecord(deletedbatch);
		return ResponseEntity.ok("OK");

	}

}
