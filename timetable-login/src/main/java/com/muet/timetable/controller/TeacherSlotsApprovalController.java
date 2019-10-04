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
import com.muet.timetable.beans.RequestSlots;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.beans.TimeTableWithoutRoom;
import com.muet.timetable.beans.User;
import com.muet.timetable.daoImpl.AssignSubjectDAOImpl;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.NotificationDetailsDAOImpl;
import com.muet.timetable.daoImpl.RequestSlotsDAOImpl;
import com.muet.timetable.daoImpl.SectionDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TeacherDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;
import com.muet.timetable.daoImpl.TimeTableWithoutRoomDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;

@Controller
@RequestMapping("/slotsapproval")
public class TeacherSlotsApprovalController {
	
	
	@Autowired
	AssignSubjectDAOImpl assignsubjectDAOImpl;
	
	@Autowired
	RequestSlotsDAOImpl requestSlotsDAOImpl;
	
	@Autowired
	DayDAOImpl dayDAOImpl;
	
	@Autowired
	TimeSlotDAOImpl timeslotdaoimpl;
	
	@Autowired
	TimeTableWithoutRoomDAOImpl timetablewithoutroomdaoimpl;
	
	@Autowired
	TimeSlotDailyDAOImpl timeslotdailydaoimpl;
	
	@Autowired
	UserDAOImpl userDAOImpl;
	
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String DayPage(Model modele,@RequestParam("assignsubject_id") String assignsubject_id,Principal principal) {
		
		Long id = Long.parseLong(assignsubject_id);
		AssignSubject assignSubject= assignsubjectDAOImpl.getRecordById(id);
		//User teacher=userDAOImpl.findByUsername(principal.getName());

		
		modele.addAttribute("timeslotapproval", timetablewithoutroomdaoimpl.getAllRecordsByAssignSubject(assignSubject));
		modele.addAttribute("timeslotdialy", timeslotdailydaoimpl.getAllRecords());
		modele.addAttribute("assignsubject", timetablewithoutroomdaoimpl.getAllRecordsByAssignSubject(assignSubject).get(0).getAssignsubject());
		
		
	for (TimeTableWithoutRoom room: timetablewithoutroomdaoimpl.getAllRecordsByAssignSubject(assignSubject)) {
		System.out.println(room.getDay().getName()+"----"+room.getAssignsubject().getSubject().getName()+"----"+room.getTimeslot().getId());
	}
		
		return "teacher-slots-approval-page";
	}

	
	@RequestMapping(value="approve",method = RequestMethod.POST)
	public ResponseEntity<?> sendNotify(Model model,@RequestParam("timeslotwithoutroom") Long [] timeslotwithoutroom) {
		
		
		for (Long l:timeslotwithoutroom) {
			
		TimeTableWithoutRoom room= timetablewithoutroomdaoimpl.getRecordById(l);
		room.setApprovedByTeacher(1);
		timetablewithoutroomdaoimpl.updateRecord(room);
		}
		return ResponseEntity.ok("Approved");
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



	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute TimeTableWithoutRoom timetablewithoutroom, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		TimeTableWithoutRoom deletedtimetablewithoutroom = timetablewithoutroomdaoimpl.getRecordById(timetablewithoutroom .getId());
		timetablewithoutroomdaoimpl.deleteRecord(deletedtimetablewithoutroom);
		return ResponseEntity.ok("OK");

	}
	
	
	
	
	
	

}
