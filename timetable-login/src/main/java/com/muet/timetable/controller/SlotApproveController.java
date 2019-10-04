package com.muet.timetable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.muet.timetable.daoImpl.TimeTableWithoutRoomDAOImpl;

@Controller
@RequestMapping("/slotapprove")

public class SlotApproveController {
	
	@Autowired
	TimeTableWithoutRoomDAOImpl  timeTableWithoutRoomDAOImpl;
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String SlotApprovePage(Model modele,@RequestParam("assign_subject") String assign_subject) {
		
		
		
		
		
		return "slotapprove-page";
	}

	
}
