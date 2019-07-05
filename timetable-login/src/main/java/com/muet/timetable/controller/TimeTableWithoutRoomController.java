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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.beans.TimeTableWithoutRoom;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.NotificationDetailsDAOImpl;
import com.muet.timetable.daoImpl.SectionDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TeacherDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;
import com.muet.timetable.daoImpl.TimeTableWithoutRoomDAOImpl;

@Controller
@RequestMapping("/slots")
public class TimeTableWithoutRoomController {
	
	
	@Autowired
	AssignSubjectDAOImpl assignsubjectDAOImpl;
	
	@Autowired
	NotificationDetailsDAOImpl notificationdetailsdaoimpl;
	
	@Autowired
	DayDAOImpl dayDAOImpl;
	
	@Autowired
	TimeSlotDAOImpl timeslotdaoimpl;
	
	@Autowired
	TimeTableWithoutRoomDAOImpl timetablewithoutroomdaoimpl;
	
	@Autowired
	TimeSlotDailyDAOImpl timeslotdailydaoimpl;
	
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String DayPage(Model modele,@RequestParam("user_id") String user_id) {
		
		Long id = Long.parseLong(user_id);
		NotificationDetails object = notificationdetailsdaoimpl.getRecordById(id);
		modele.addAttribute("Notificationobject", object);
		List<TimeSlotDaily> timeslotdailylist = timeslotdailydaoimpl.getAllRecords();
		 modele.addAttribute("TimeslotDaily", timeslotdailylist);
		return "slots-page";
	}

	

	
	
	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		
		return ResponseEntity.ok(timetablewithoutroomdaoimpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(timetablewithoutroomdaoimpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute TimeTableWithoutRoom timetablewithoutroom, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(timetablewithoutroomdaoimpl.getRecordById(timetablewithoutroom.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute TimeTableWithoutRoom timetablewithoutroom, BindingResult bindingResult,
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
		
	    timetablewithoutroom.setCreatedAt(date);
	    timetablewithoutroom.setUpdatedAt(date);
	    timetablewithoutroom.setCreatedBy(0);
	    timetablewithoutroom.setUpdatedBy(0);
	    timetablewithoutroom.setActive(1);
	    timetablewithoutroomdaoimpl.addRecord(timetablewithoutroom);
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
	public ResponseEntity<?> delete(@ModelAttribute TimeTableWithoutRoom timetablewithoutroom, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		TimeTableWithoutRoom deletedtimetablewithoutroom = timetablewithoutroomdaoimpl.getRecordById(timetablewithoutroom .getId());
		timetablewithoutroomdaoimpl.deleteRecord(deletedtimetablewithoutroom);
		return ResponseEntity.ok("OK");

	}
	
	
	
	
	
	

}
