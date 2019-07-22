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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.beans.User;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.NotificationDetailsDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TeacherDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;
import com.muet.timetable.repository.UserRepository;

@Controller
@RequestMapping("/notification")
public class NotificationController {

	
	@Autowired
	NotificationDetailsDAOImpl notificationdaoimpl;
	
	@Autowired
	UserDAOImpl userdaoimpl;
	
	@Autowired
	TeacherDAOImpl teacherDAOImpl;
	
	@Autowired
	AssignSubjectDAOImpl assignSubjectDAOImpl;
	
	@Autowired
	UserRepository userRepository;
	
	
	

	
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String DayPage(Model modele,@RequestParam("assign_id") long assign_id) {
		//List <NotificationDetails> list =notificationdaoimpl.getAllRecords();
		//modele.addAttribute("notification", list);
		
		
		
		
		AssignSubject assignSubject = assignSubjectDAOImpl.getRecordById(assign_id);
		
		
		
		modele.addAttribute("teacher_name", assignSubject.getTeacher().getName());

		modele.addAttribute("teacher_subject", assignSubject.getSubject().getName());
		modele.addAttribute("teacher_subject_type", assignSubject.getSubject().getType());
		
		
		modele.addAttribute("teacher_id", assignSubject.getTeacher().getId());
		//AssignSubject assignSubject=assignSubjectDAOImpl.getAllRecordsByTeacher(teacher);
		modele.addAttribute("assign_id", assignSubject.getId());

		
		
		//System.out.println("Teacher: "+assignSubject.getTeacher().getName());
		//modele.addAttribute("teacher", list);
		
		
	   
		return "notification-page";
	}
	
	
	

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		
		return ResponseEntity.ok(notificationdaoimpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(notificationdaoimpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute NotificationDetails notificationdetails, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(notificationdaoimpl.getRecordById(notificationdetails.getId()));

	}
	
	
	@PostMapping("/getConversation")
	public ResponseEntity<?> getConversation(@ModelAttribute NotificationDetails notificationdetails, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(notificationdaoimpl.getNotificationByAssignSubject(notificationdetails.getAssignsubject()));

	}

	
	
	

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute NotificationDetails notificationdetails, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		
		
	//	System.out.println("Desc: "+notificationdetails.getDescription());
	//	System.out.println("Teacher: "+notificationdetails.getTeacher().getName());
	//	System.out.println("Assign: "+notificationdetails.getAssignsubject().getId());


		
		
		
		User user=userRepository.findByUsername(httpServletRequest.getUserPrincipal().getName());
		
		notificationdetails.setSender(user);
		
		
		LocalDateTime myDateObj = LocalDateTime.now(); 
		 
	    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"); 

	    String datetime = myDateObj.format(myFormatObj); 
	    
	  notificationdetails.setDatetime(datetime);  
	
	  
	    notificationdetails.setActive(1);
	    notificationdaoimpl.addRecord(notificationdetails);
	    
		return ResponseEntity.ok("OK");

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
	public ResponseEntity<?> delete(@ModelAttribute NotificationDetails notificationdetails, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		NotificationDetails deletednotificationdetails = notificationdaoimpl.getRecordById(notificationdetails.getId());
		notificationdaoimpl.deleteRecord(deletednotificationdetails);
		return ResponseEntity.ok("OK");

	}
	
	
	
}
