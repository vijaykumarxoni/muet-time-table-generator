package com.muet.timetable.controller;

import java.security.Principal;
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
import com.muet.timetable.daoImpl.DayDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;




@Controller
@RequestMapping("/day")
public class DayController {

	@Autowired
	DayDAOImpl dayDAOImpl;
	
	@Autowired
	UserDAOImpl userDAO;

	@RequestMapping("")
	public String DayPage(Model modele,Principal principal) {
		
		String adminRole=userDAO.findByUsername(principal.getName()).getAdminRole();
		if (adminRole.equals("SuperAdmin")) {
			modele.addAttribute("request", "SuperAdmin");
		}
		return "day-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 7, Direction.ASC, "id");
		return ResponseEntity.ok(dayDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getTotalAdmin")
	public ResponseEntity<?> getTotalAdmin() {
		
		return ResponseEntity.ok(dayDAOImpl.getAllRecords().size());

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		ModelAndView model = new ModelAndView("day-page");
		return ResponseEntity.ok(dayDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Day day, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println(dayDAOImpl.getRecordById(day.getId()).toString());
		return ResponseEntity.ok(dayDAOImpl.getRecordById(day.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Day day, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		
		
		day.setActive(1);
		dayDAOImpl.addRecord(day);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Day day, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Day updatedDay = dayDAOImpl.getRecordById(day.getId());
		updatedDay.setName(day.getName());
		dayDAOImpl.updateRecord(updatedDay);

		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Day day, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Day deletedDay = dayDAOImpl.getRecordById(day.getId());
		dayDAOImpl.deleteRecord(deletedDay);
		return ResponseEntity.ok("OK");

	}

}
