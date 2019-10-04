package com.muet.timetable.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.resource.PrincipalExtractor;
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
import com.muet.timetable.beans.Subject;
import com.muet.timetable.beans.User;
import com.muet.timetable.dao.UserDAO;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;

@Controller
@RequestMapping("/subject")

public class SubjectController {

	@Autowired
	SubjectDAOImpl subjectDAOImpl;
	
	@Autowired
	SemesterDAOImpl semesterDAOImpl;
	
	@Autowired
	DepartmentDAOImpl deptDAOImpl;
	
	@Autowired
	UserDAOImpl userDAO;
	
	

	@RequestMapping("")
	public String DayPage(Model modele,Principal principal) {
		
		String adminRole=userDAO.findByUsername(principal.getName()).getAdminRole();
		if (adminRole.equals("SuperAdmin")) {
			modele.addAttribute("request", "SuperAdmin");
		}
		
		
		return "subject-page";
	}
	
	
	

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page, Principal principal) {
		Pageable pageable = new PageRequest(page, 10, Direction.DESC, "id");
		Department department=userDAO.findByUsername(principal.getName()).getDepartment();
		
		if (department==null) {
			
			return ResponseEntity.ok(subjectDAOImpl.getAllRecords(pageable));
		}
		else {
			return ResponseEntity.ok(subjectDAOImpl.getAllRecords(department,pageable));
		}

	}
	
	@PostMapping("/getTotalAdmin")
	public ResponseEntity<?> getTotalAdmin() {
		 		
		return ResponseEntity.ok(subjectDAOImpl.getAllRecords().size());

	}
	
	@PostMapping("/getTotal")
	public ResponseEntity<?> getTotal(@RequestParam(defaultValue = "0") int page, Principal principal) {
		
		Department department=userDAO.findByUsername(principal.getName()).getDepartment(); 		
		return ResponseEntity.ok(subjectDAOImpl.getAllRecordsByDept(department).size());

	}
	

	
	@PostMapping("/getList")
	public ResponseEntity<?> getList(@RequestParam(name = "deptId") long  deptId) {
		return ResponseEntity.ok(subjectDAOImpl.getAllRecordsByDept(deptDAOImpl.getRecordById(deptId)));

	}
	
	@PostMapping("/getAllList")
	public ResponseEntity<?> getAllList() {
		return ResponseEntity.ok(subjectDAOImpl.getAllRecords());

	}
	
	

	@PostMapping("/getListByDept")
	public ResponseEntity<?> getListByDepartment(Principal principal) {
		User user=userDAO.findByUsername(principal.getName());
		Department department=deptDAOImpl.getRecordById(user.getDepartment().getId());
		return ResponseEntity.ok(subjectDAOImpl.getAllRecordsByDept(department));

	}

	
	
	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println(subjectDAOImpl.getRecordById(batch.getId()).toString());
		return ResponseEntity.ok(subjectDAOImpl.getRecordById(batch.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Subject subject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest, Principal principal) {
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
		Department department=userDAO.findByUsername(principal.getName()).getDepartment(); 		

	    subject.setDept(department);
	    subject.setCreatedAt(date);
	    subject.setUpdatedAt(date);
	    subject.setCreatedBy(0);
	    subject.setUpdatedBy(0);
	    subject.setActive(1);
		subjectDAOImpl.addRecord(subject);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Subject subject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest,Principal principal) {
		Subject updatedsubject = subjectDAOImpl.getRecordById(subject.getId());
		updatedsubject.setName(subject.getName());
		updatedsubject.setCode(subject.getCode());
		updatedsubject.setCredit_hour(subject.getCredit_hour());
		Department dept=userDAO.findByUsername(principal.getName()).getDepartment();
		Semester semester = semesterDAOImpl.getRecordById(subject.getSemester().getId());
		updatedsubject.setDept(dept);
		updatedsubject.setType(subject.getType());
		updatedsubject.setSemester(semester);
		subjectDAOImpl.updateRecord(updatedsubject);
		return ResponseEntity.ok("OK");
	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Subject subject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Subject deletedsemester = subjectDAOImpl.getRecordById(subject.getId());
		subjectDAOImpl.deleteRecord(deletedsemester);
		return ResponseEntity.ok("OK");

	}

}
