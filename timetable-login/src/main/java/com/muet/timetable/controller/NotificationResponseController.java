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

import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.NotificationResponse;
import com.muet.timetable.daoImpl.NotificationResponseDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;

@Controller
@RequestMapping("/notificationresponse")
public class NotificationResponseController {
	
	@Autowired
	NotificationResponseDAOImpl notificationresponsedaoimpl;
	
	@Autowired
	UserDAOImpl userdaoimpl;
	

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		
		return ResponseEntity.ok(notificationresponsedaoimpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(notificationresponsedaoimpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute NotificationResponse notificationresponse, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(notificationresponsedaoimpl.getRecordById(notificationresponse.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute NotificationResponse notificationresponse, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Date date3 = Calendar.getInstance().getTime();
	    SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");

	    java.sql.Date date = null;

	    try {
	        date =new java.sql.Date(df.parse(df.format(date3)).getTime());
	       
	    } catch (ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
		
	    notificationresponse.setCreatedAt(date);
	    notificationresponse.setUpdatedAt(date);
	    notificationresponse.setCreatedBy(0);
	    notificationresponse.setUpdatedBy(0);
	    notificationresponse.setActive(1);
	    notificationresponsedaoimpl.addRecord(notificationresponse);
		return ResponseEntity.ok("OK");

	}



	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute NotificationResponse notificationresponse, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		NotificationResponse deletednotificationdetails = notificationresponsedaoimpl.getRecordById(notificationresponse.getId());
		notificationresponsedaoimpl.deleteRecord(deletednotificationdetails);
		return ResponseEntity.ok("OK");

	}
	

}
