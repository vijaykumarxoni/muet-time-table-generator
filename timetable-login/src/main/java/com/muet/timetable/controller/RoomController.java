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

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.Room;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.FacultyDAOImpl;
import com.muet.timetable.daoImpl.RoomDAOImpl;;

@Controller
@RequestMapping("/classroom")

public class RoomController {

	@Autowired
	RoomDAOImpl roomDAOImpl;

	@Autowired
	DepartmentDAOImpl departmentDAOImpl;
//	

//	 

	@RequestMapping("")
	public String DepartmentPage(Model modele) {

		return "classroom-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.DESC, "id");
		return ResponseEntity.ok(roomDAOImpl.getAllRecords(pageable));

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Room room, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(roomDAOImpl.getRecordById(room.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Room room, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		room.setActive(1);
		roomDAOImpl.addRecord(room);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Room room, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Room updatedRoom = roomDAOImpl.getRecordById(room.getId());
		updatedRoom.setName(room.getName());
		updatedRoom.setType(room.getType());

		Department department = departmentDAOImpl.getRecordById(room.getDepartment().getId());
		department.setId(room.getDepartment().getId());
		updatedRoom.setDepartment(department);

		roomDAOImpl.updateRecord(updatedRoom);

		return ResponseEntity.ok("OK");

	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Room room, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Room deletedRoom = roomDAOImpl.getRecordById(room.getId());
		roomDAOImpl.deleteRecord(deletedRoom);
		return ResponseEntity.ok("OK");

	}

}
