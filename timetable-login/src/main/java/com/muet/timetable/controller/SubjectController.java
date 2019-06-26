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
import com.muet.timetable.beans.Subject;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;

@Controller
@RequestMapping("/subject")

public class SubjectController {

	@Autowired
	SubjectDAOImpl subjectDAOImpl;
	
	@Autowired
	SemesterDAOImpl semesterDAOImpl;
	
	@Autowired
	DepartmentDAOImpl deptDAOImpl;

	@RequestMapping("")
	public String DayPage(Model modele) {
		return "subject-page";
	}
	
	
	public int getCreditHours(int semester_id,int dept_id) {
		int count=0;
	List<Subject>subjects=subjectDAOImpl.getAllRecords();
	
	for (Subject subject: subjects) {
		count+=Integer.parseInt(subject.getCredit_hour());
		//System.out.println("subjects: "+subject.getName());
		
	}
	
		return count;
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.DESC, "id");
		
		  System.out.println(getCreditHours(6,1));

		return ResponseEntity.ok(subjectDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		ModelAndView model = new ModelAndView("batch-page");
		return ResponseEntity.ok(subjectDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Batch batch, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println(subjectDAOImpl.getRecordById(batch.getId()).toString());
		return ResponseEntity.ok(subjectDAOImpl.getRecordById(batch.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Subject subject, BindingResult bindingResult,
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
			HttpServletRequest httpServletRequest) {
		Subject updatedsubject = subjectDAOImpl.getRecordById(subject.getId());
		updatedsubject.setName(subject.getName());
		updatedsubject.setCode(subject.getCode());
		updatedsubject.setCredit_hour(subject.getCredit_hour());
		Department dept =deptDAOImpl.getRecordById(subject.getDept().getId());
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
