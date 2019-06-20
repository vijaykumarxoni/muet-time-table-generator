package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Faculty;
import com.muet.timetable.dao.FacultyDAO;
import com.muet.timetable.repository.FacultyRepository;

@Service
@Transactional
public class FacultyDAOImpl implements FacultyDAO {

	
	@Autowired
	FacultyRepository facultyRepository;

	
	public Page<Faculty> getAllRecords(Pageable pageable) {
		return facultyRepository.findAll(pageable);
	}

	public Faculty getRecordById(Long id) {

		return facultyRepository.findOne(id);

	}

	public Faculty addRecord(Faculty faculty) {
          faculty.setActive(1);
          faculty.setCreatedBy(1);
		return facultyRepository.save(faculty);
		

	}

	public int updateRecord(Faculty faculty) {
		// TODO Auto-generated method stub
		 facultyRepository.save(faculty);
		 return 1;

	}

	public int deleteRecord(Faculty faculty) {
		// TODO Auto-generated method stub
		faculty.setActive(0);
		 facultyRepository.save(faculty);
		 return 1;
	}

	public List<Faculty> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Faculty>) facultyRepository.findAll();
	}
	
	
}
