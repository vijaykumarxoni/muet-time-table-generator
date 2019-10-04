package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.dao.TeacherDAO;
import com.muet.timetable.repository.TeacherRepository;

@Service
@Transactional
public class TeacherDAOImpl implements TeacherDAO {

	
	@Autowired
	TeacherRepository teacherRepository;

	
	public Page<Teacher> getAllRecords(Department department,Pageable pageable) {
		return teacherRepository.getAllRecordsByDept(department, pageable);
	}

	public Teacher getRecordById(Long id) {

		return teacherRepository.findOne(id);

	}

	public Teacher addRecord(Teacher teacher) {
		teacher.setActive(1);
		teacher.setCreatedBy(1);
		return teacherRepository.save(teacher);
		

	}

	public int updateRecord(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherRepository.save(teacher);
		 return 1;

	}

	public int deleteRecord(Teacher teacher) {
		// TODO Auto-generated method stub
		teacher.setActive(0);
		teacherRepository.save(teacher);
		 return 1;
	}

	public List<Teacher> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Teacher>) teacherRepository.findAll();
	}
	
	
	public Page<Teacher> getAllRecords(Pageable pageable) {
		return teacherRepository.findAll(pageable);
	}

	@Override
	public List<Teacher> getAllRecordsByDepartment(Department depart) {
		// TODO Auto-generated method stub
		return (List<Teacher>)teacherRepository.getAllRecordsByDept(depart);
	}

	@Override
	public Teacher getRecordByNameDeptEmailContact(String name, Department department, String email, String contact) {
		// TODO Auto-generated method stub
return teacherRepository.getAllRecordsByNameEmailDeptContact(name, department, email, contact);
	
	}
	
	
}
