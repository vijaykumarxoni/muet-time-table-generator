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

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.SectionDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TeacherDAOImpl;

@Controller
@RequestMapping("/assignsubject")
public class AssignSubjectController {
	
	@Autowired
	AssignSubjectDAOImpl assignsubjectDAOImpl;

	
	@Autowired
	SubjectDAOImpl subjectDAOImpl;
	
	@Autowired
	TeacherDAOImpl teacherDAOImpl;
	
	@Autowired
	BatchDAOImpl batchDAOImpl;
	
	
	@Autowired
	SemesterDAOImpl semesterDAOImpl;
	@Autowired
	SectionDAOImpl sectionDAOImpl;
	

	
	@RequestMapping("")
	public String DayPage(Model modele) {
		
		return "assignsubject-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		
		return ResponseEntity.ok(assignsubjectDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(assignsubjectDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(assignsubjectDAOImpl.getRecordById(assignsubject.getId()));

	}
	
	
	@PostMapping("/getbybatch")
	public ResponseEntity<?> getByBatch(@ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		
		System.out.println("batch: "+assignsubject.getBatch());
		System.out.println("section: "+assignsubject.getSection());
		
		return ResponseEntity.ok(assignsubjectDAOImpl.getAllRecordsByBatchAndSection(assignsubject.getBatch(), assignsubject.getSection()));

	}
	

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
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
		
	    assignsubject.setCreatedAt(date);
	    assignsubject.setUpdatedAt(date);
	    assignsubject.setCreatedBy(0);
	    assignsubject.setUpdatedBy(0);
	    assignsubject.setActive(1);
	    assignsubjectDAOImpl.addRecord(assignsubject);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		AssignSubject updatedassignsubject = assignsubjectDAOImpl.getRecordById(assignsubject.getId());
		Subject subject =subjectDAOImpl.getRecordById(assignsubject.getSubject().getId());
		Teacher teacher =teacherDAOImpl.getRecordById(assignsubject.getTeacher().getId());
		Batch batch =batchDAOImpl.getRecordById(assignsubject.getBatch().getId());
		Semester semester =semesterDAOImpl.getRecordById(assignsubject.getSemester().getId());
		Section section=sectionDAOImpl.getRecordById(assignsubject.getSection().getId());
		updatedassignsubject.setSubject(subject);
		updatedassignsubject.setTeacher(teacher);
		updatedassignsubject.setBatch(batch);
		updatedassignsubject.setSemester(semester);
		updatedassignsubject.setSection(section);
        assignsubjectDAOImpl.updateRecord(updatedassignsubject);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		AssignSubject deletedassignsubject = assignsubjectDAOImpl.getRecordById(assignsubject.getId());
		assignsubjectDAOImpl.deleteRecord(deletedassignsubject);
		return ResponseEntity.ok("OK");

	}
	
}
