package com.muet.timetable.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Role;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.beans.User;
import com.muet.timetable.dao.RoleDAO;
import com.muet.timetable.dao.UserDAO;
import com.muet.timetable.daoImpl.BatchDAOImpl;
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.SemesterDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TeacherDAOImpl;
import com.muet.timetable.daoImpl.UserDAOImpl;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	TeacherDAOImpl teacherDAOImpl;

	@Autowired
	DepartmentDAOImpl deptDAOImpl;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private RoleDAO roleDAO;
	
	@Autowired
	private UserDAOImpl userDAOImpl;
	
	@Autowired
	private BatchDAOImpl batchDAOImpl;

	@Autowired
	private SemesterDAOImpl semesterDAOImpl;



	@RequestMapping("")
	public String TeacherPage(Model model, Principal principal) {
		
		String adminRole=userDAO.findByUsername(principal.getName()).getAdminRole();
		if (adminRole.equals("SuperAdmin")) {
			model.addAttribute("request", "SuperAdmin");
		}
		
		
		User user = userDAOImpl.findByUsername(principal.getName());
		//For Side bar
		List<Batch> batchs = batchDAOImpl.getAllRecordsByDept(user.getDepartment());
    	List<Semester> semesters = semesterDAOImpl.getAllRecords();
     	model.addAttribute("batchs",batchs);
    	model.addAttribute("semesters",semesters);
    	//
		
		
		return "teacher-page";
	}

	@RequestMapping("/dashboard")
	public String TeacherDashboard(Model modele) {
		return "teacher-dashboard-page";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page, Principal principal) {
		Pageable pageable = new PageRequest(page, 10, Direction.ASC, "id");

		Department department = userDAO.findByUsername(principal.getName()).getDepartment();
		
		if (department==null) {
		
			return ResponseEntity.ok(teacherDAOImpl.getAllRecords(pageable));
			
		}else
		{
			

		return ResponseEntity.ok(teacherDAOImpl.getAllRecords(department, pageable));
		}

	}
	
	@PostMapping("/getTotal")
	public ResponseEntity<?> getTotal(@RequestParam(defaultValue = "0") int page, Principal principal) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");

		Department department = userDAO.findByUsername(principal.getName()).getDepartment();

		return ResponseEntity.ok(teacherDAOImpl.getAllRecordsByDepartment(department).size());

	}
	
	@PostMapping("/getTotalAdmin")
	public ResponseEntity<?> getTotal() {

		return ResponseEntity.ok(teacherDAOImpl.getAllRecords().size());

	}

	@PostMapping("/getListByDept")
	public ResponseEntity<?> getListByDepartment(Principal principal) {
		User user = userDAO.findByUsername(principal.getName());
		Department department = deptDAOImpl.getRecordById(user.getDepartment().getId());
		return ResponseEntity.ok(teacherDAOImpl.getAllRecordsByDepartment(department));

	}

	@PostMapping("/getList")
	public ResponseEntity<?> getList(@RequestParam(name = "deptId") long deptId) {
		return ResponseEntity.ok(teacherDAOImpl.getAllRecordsByDepartment(deptDAOImpl.getRecordById(deptId)));

	}
	
	@PostMapping("/getAllList")
	public ResponseEntity<?> getAllList() {
		return ResponseEntity.ok(teacherDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Teacher teacher, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println("teacher ID "+teacherDAOImpl.getRecordById(teacher.getId()).toString());
		return ResponseEntity.ok(teacherDAOImpl.getRecordById(teacher.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Teacher teacher, BindingResult bindingResult,
			HttpServletRequest httpServletRequest, Principal principal) {

		teacher.setCreatedBy(0);
		teacher.setUpdatedBy(0);
		teacher.setActive(1);
		teacherDAOImpl.addRecord(teacher);

		Department department = userDAO.findByUsername(principal.getName()).getDepartment();
		Teacher lastAddedTeacher = teacherDAOImpl.getRecordByNameDeptEmailContact(teacher.getName(), department,
				teacher.getEmail(), teacher.getContact());

		teacher.setDept(department);
		User teacherUser = new User();
		teacherUser.setTeacher(lastAddedTeacher);
		teacherUser.setTeacher(teacher);
		teacherUser.setEmail(teacher.getEmail());
		teacherUser.setUsername(teacher.getEmail());
		teacherUser.setPassword(teacher.getPassword());
		teacherUser.setPasswordConfirm(teacher.getPassword());
		teacherUser.setAdminRole("Teacher");
		teacherUser.setDepartment(department);
		Set<Role> roles = new HashSet<Role>();
		Role role = roleDAO.getRecordById(2L);
		roles.add(role);
		teacherUser.setRoles(roles);

		userDAO.save(teacherUser);

		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Teacher teacher, BindingResult bindingResult,
			HttpServletRequest httpServletRequest, Principal principal) {
		Teacher updatedteacher = teacherDAOImpl.getRecordById(teacher.getId());
		updatedteacher.setName(teacher.getName());
		updatedteacher.setEmail(teacher.getEmail());
		updatedteacher.setPassword(teacher.getPassword());
		updatedteacher.setDesignation(teacher.getDesignation());
		updatedteacher.setGender(teacher.getGender());
		updatedteacher.setContact(teacher.getContact());
		Department dept = userDAO.findByUsername(principal.getName()).getDepartment();
		updatedteacher.setDept(dept);
		teacherDAOImpl.updateRecord(updatedteacher);
		return ResponseEntity.ok("OK");
	}

	@PostMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute Teacher subject, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Teacher deletedteacher = teacherDAOImpl.getRecordById(subject.getId());
		teacherDAOImpl.deleteRecord(deletedteacher);
		return ResponseEntity.ok("OK");

	}

}
