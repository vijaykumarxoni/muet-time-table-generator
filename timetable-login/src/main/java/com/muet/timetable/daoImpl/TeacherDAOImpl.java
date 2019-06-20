package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Teacher;
import com.muet.timetable.dao.TeacherDAO;
import com.muet.timetable.repository.TeacherRepository;

@Service
@Transactional
public class TeacherDAOImpl implements TeacherDAO {

	
	@Autowired
	TeacherRepository TeacherRepository;

	
	public Page<Teacher> getAllRecords(Pageable pageable) {
		return TeacherRepository.findAll(pageable);
	}

	public Teacher getRecordById(Long id) {

		return TeacherRepository.findOne(id);

	}

	public Teacher addRecord(Teacher teacher) {
		teacher.setActive(1);
		teacher.setCreatedBy(1);
		return TeacherRepository.save(teacher);
		

	}

	public int updateRecord(Teacher teacher) {
		// TODO Auto-generated method stub
		 TeacherRepository.save(teacher);
		 return 1;

	}

	public int deleteRecord(Teacher teacher) {
		// TODO Auto-generated method stub
		teacher.setActive(0);
		 TeacherRepository.save(teacher);
		 return 1;
	}

	public List<Teacher> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Teacher>) TeacherRepository.findAll();
	}
	
	
}
