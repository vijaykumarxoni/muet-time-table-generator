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

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.Room;
import com.muet.timetable.beans.User;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.FacultyDAOImpl;
import com.muet.timetable.daoImpl.RoomDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;;

@Controller
@RequestMapping("/classroom")

public class RoomController {

	@Autowired
	RoomDAOImpl roomDAOImpl;

	@Autowired
	UserDAOImpl userDAO;

	
	@Autowired
	DepartmentDAOImpl departmentDAOImpl;
//	

//	 

	@RequestMapping("")
	public String DepartmentPage(Model modele) {

		return "classroom-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page, Principal principal) {
		Pageable pageable = new PageRequest(page, 4, Direction.DESC, "id");
		Department department=userDAO.findByUsername(principal.getName()).getDepartment();

		return ResponseEntity.ok(roomDAOImpl.getAllRecords(department,pageable));

	}
	
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList(@RequestParam(name = "deptId") long  deptId) {
		return ResponseEntity.ok(roomDAOImpl.getAllRecordsByDept(departmentDAOImpl.getRecordById(deptId)));

	}
	@PostMapping("/getListByDept")
	public ResponseEntity<?> getListByDepartment(Principal principal) {
		User user=userDAO.findByUsername(principal.getName());
		Department department=departmentDAOImpl.getRecordById(user.getDepartment().getId());
		return ResponseEntity.ok(roomDAOImpl.getAllRecordsByDept(department));

	}

	
	
	

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Room room, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		return ResponseEntity.ok(roomDAOImpl.getRecordById(room.getId()));

	}
	
	
	
	
	
	

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Room room, BindingResult bindingResult,
			HttpServletRequest httpServletRequest,Principal principal) {
		room.setActive(1);
		Department department=userDAO.findByUsername(principal.getName()).getDepartment(); 		

		room.setDepartment(department);
		roomDAOImpl.addRecord(room);
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Room room, BindingResult bindingResult,
			HttpServletRequest httpServletRequest,Principal principal) {
		Room updatedRoom = roomDAOImpl.getRecordById(room.getId());
		updatedRoom.setName(room.getName());
		updatedRoom.setType(room.getType());

		Department dept=userDAO.findByUsername(principal.getName()).getDepartment();
		updatedRoom.setDepartment(dept);

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
