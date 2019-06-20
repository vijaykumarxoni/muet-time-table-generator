package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.dao.BatchDAO;
import com.muet.timetable.dao.SemesterDAO;
import com.muet.timetable.repository.SemesterRepository;
import com.muet.timetable.repository.SubjectRepository;

@Service
@Transactional
public class SemesterDAOImpl implements SemesterDAO {

	@Autowired
	SemesterRepository semesterrepository;
	
	public Page<Semester> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return semesterrepository.findAll(pageable);
	}

	public Semester getRecordById(Long id) {
		// TODO Auto-generated method stub
		return semesterrepository.findOne(id);
	}

	public Semester addRecord(Semester semester) {
		// TODO Auto-generated method stub
		semester.setActive(1);
		semester.setCreatedBy(1);
		return semesterrepository.save(semester);
	}

	public int updateRecord(Semester semester) {
		// TODO Auto-generated method stub
		semesterrepository.save(semester);
		return 1;
	}

	public int deleteRecord(Semester semester) {
		// TODO Auto-generated method stub
		semester.setActive(0);
		semesterrepository.save(semester);
		return 1;
	}

	public List<Semester> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Semester>) semesterrepository.findAll();
	}

}
