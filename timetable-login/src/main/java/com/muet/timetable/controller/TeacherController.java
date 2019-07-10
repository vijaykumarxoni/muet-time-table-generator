package com.muet.timetable.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
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
import com.muet.timetable.daoImpl.DepartmentDAOImpl;
import com.muet.timetable.daoImpl.SubjectDAOImpl;
import com.muet.timetable.daoImpl.TeacherDAOImpl;

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

		
	
	@RequestMapping("")
	public String TeacherPage(Model modele) {
		return "teacher-page";
	}
	@RequestMapping("/dashboard")
	public String TeacherDashboard(Model modele) {
		return "teacher-dashboard";
	}

	@PostMapping("/getall")
	public ResponseEntity<?> getAll(@RequestParam(defaultValue = "0") int page) {
		Pageable pageable = new PageRequest(page, 4, Direction.ASC, "id");
		return ResponseEntity.ok(teacherDAOImpl.getAllRecords(pageable));

	}
	
	@PostMapping("/getList")
	public ResponseEntity<?> getList() {
		return ResponseEntity.ok(teacherDAOImpl.getAllRecords());

	}

	@PostMapping("/get")
	public ResponseEntity<?> getOne(@ModelAttribute Teacher teacher, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {

		System.out.println(teacherDAOImpl.getRecordById(teacher.getId()).toString());
		return ResponseEntity.ok(teacherDAOImpl.getRecordById(teacher.getId()));

	}

	@PostMapping("/save")
	public ResponseEntity<?> save(@ModelAttribute Teacher teacher, BindingResult bindingResult,
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
	    teacher.setCreatedAt(date);
	    teacher.setUpdatedAt(date);
	    teacher.setCreatedBy(0);
	    teacher.setUpdatedBy(0);
	    teacher.setActive(1);
	    teacherDAOImpl.addRecord(teacher);
	    
	    
	    User teacherUser=new User();
	    teacherUser.setEmail(teacher.getEmail());
	    teacherUser.setUsername(teacher.getEmail());
	    teacherUser.setPassword(teacher.getPassword());
	    teacherUser.setPasswordConfirm(teacher.getPassword());
	    teacherUser.setAdminRole("Teacher");
	    teacherUser.setDepartment(teacher.getDept());
	    Set<Role> roles=new HashSet<Role>();
	    Role role=roleDAO.getRecordById(2L);
	    
	    roles.add(role);
	    
	   userDAO.save(teacherUser);
	    
	    
	    
	    
		return ResponseEntity.ok("OK");

	}

	@PostMapping("/update")
	public ResponseEntity<?> update(@ModelAttribute Teacher teacher, BindingResult bindingResult,
			HttpServletRequest httpServletRequest) {
		Teacher updatedteacher = teacherDAOImpl.getRecordById(teacher.getId());
		updatedteacher.setName(teacher.getName());
		updatedteacher.setEmail(teacher.getEmail());
		updatedteacher.setPassword(teacher.getPassword());
		updatedteacher.setDesignation(teacher.getDesignation());
		updatedteacher.setGender(teacher.getGender());
		updatedteacher.setContact(teacher.getContact());
		Department dept =deptDAOImpl.getRecordById(teacher.getDept().getId());
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
