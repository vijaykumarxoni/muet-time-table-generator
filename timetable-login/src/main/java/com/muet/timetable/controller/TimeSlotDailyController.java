package com.muet.timetable.controller;

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

import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.TimeSlotDailyDAOImpl;;

@Controller
@RequestMapping("/timeSlotDaily")

public class TimeSlotDailyController {

	@Autowired
	TimeSlotDailyDAOImpl timeSlotDailyDaoImpl;

	@Autowired
	DayDAOImpl dayDAOImpl;

	@RequestMapping("")
	public String DepartmentPage(Model modele) {

		return "time-slot-daily-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		return ResponseEntity.ok(timeSlotDailyDaoImpl.getAllRecords(pageable));

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute TimeSlotDaily timeSlotDaily, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(timeSlotDailyDaoImpl.getRecordById(timeSlotDaily.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute TimeSlotDaily timeSlotDaily, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		timeSlotDaily.setActive(1);
		timeSlotDaily.setUpdatedBy(1);
		timeSlotDailyDaoImpl.addRecord(timeSlotDaily);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute TimeSlotDaily timeSlotDaily, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		TimeSlotDaily updatedTimeSlotDaily = timeSlotDailyDaoImpl.getRecordById(timeSlotDaily.getId());
		updatedTimeSlotDaily.setDuration(timeSlotDaily.getDuration());
		updatedTimeSlotDaily.setTotalSlots(timeSlotDaily.getTotalSlots());

		Day day = dayDAOImpl.getRecordById(timeSlotDaily.getDay().getId());

		updatedTimeSlotDaily.setDay(day);

		timeSlotDailyDaoImpl.updateRecord(updatedTimeSlotDaily);

		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute TimeSlotDaily timeSlotDaily, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		TimeSlotDaily deletedTimeSlotDaily = timeSlotDailyDaoImpl.getRecordById(timeSlotDaily.getId());
		timeSlotDailyDaoImpl.deleteRecord(deletedTimeSlotDaily);
		return ResponseEntity.ok("OK");

	}

}
