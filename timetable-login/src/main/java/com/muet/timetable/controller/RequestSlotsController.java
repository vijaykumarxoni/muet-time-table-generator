package com.muet.timetable.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.RequestSlots;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.dao.RequestSlotsDAO;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.NotificationDetailsDAOImpl;
import com.muet.timetable.daoImpl.RequestSlotsDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;

@Controller
@RequestMapping("/requestslots")
public class RequestSlotsController {

	
	@Autowired
	RequestSlotsDAOImpl requestSlotsDAOImpl;
	
	@Autowired
	UserDAOImpl userdaoimpl;
	

	
	
	@RequestMapping("")
	public String DayPage(Model modele) {
		List <RequestSlots> list =requestSlotsDAOImpl.getAllRecords();
		modele.addAttribute("notification", list);
	   
		return "requestslots-page";
	}
	
	
	

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		
		return ResponseEntity.ok(requestSlotsDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(requestSlotsDAOImpl.getAllRecords());

	}
	
	
	
	
	
	
	
	
	
	

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute NotificationDetails notificationdetails, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(requestSlotsDAOImpl.getRecordById(notificationdetails.getId()));

	}
	
	
	@PostMapping("/deactive")
	public ResponseEntity<?> setDeactive(@ModelAttribute NotificationDetails notificationdetails, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		
		RequestSlots requestSlots=requestSlotsDAOImpl.getRecordById(notificationdetails.getId());
		requestSlots.setActive(0);
		requestSlotsDAOImpl.updateRecord(requestSlots);
		
		return ResponseEntity.ok("OK");

	}
	
	
	

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute RequestSlots requestSlots, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
	

		
	
		requestSlots.setActive(1);
	    requestSlotsDAOImpl.addRecord(requestSlots);
		return ResponseEntity.ok("OKz");

	}

//	@PostMapping("/update")
//	public ResponseEntity<?> update(@ModelAttribute AssignSubject assignsubject, BindingResult bindingResult,
//			HttpServletRequest httpServletRequest) {
//		AssignSubject updatedassignsubject = assignsubjectDAOImpl.getRecordById(assignsubject.getId());
//		Subject subject =subjectDAOImpl.getRecordById(assignsubject.getSubject().getId());
//		Teacher teacher =teacherDAOImpl.getRecordById(assignsubject.getTeacher().getId());
//		Batch batch =batchDAOImpl.getRecordById(assignsubject.getBatch().getId());
//		Semester semester =semesterDAOImpl.getRecordById(assignsubject.getSemester().getId());
//		Section section=sectionDAOImpl.getRecordById(assignsubject.getSection().getId());
//		updatedassignsubject.setSubject(subject);
//		updatedassignsubject.setTeacher(teacher);
//		updatedassignsubject.setBatch(batch);
//		updatedassignsubject.setSemester(semester);
//		updatedassignsubject.setSection(section);
//        assignsubjectDAOImpl.updateRecord(updatedassignsubject);
//		return ResponseEntity.ok("OK");
//
//	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute RequestSlots requestSlots, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		RequestSlots deletednotificationdetails = requestSlotsDAOImpl.getRecordById(requestSlots.getId());
		requestSlotsDAOImpl.deleteRecord(deletednotificationdetails);
		return ResponseEntity.ok("OK");

	}
	
	
	
}
