package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Subject;
import com.muet.timetable.dao.BatchDAO;
import com.muet.timetable.dao.SubjectDAO;
import com.muet.timetable.repository.BatchRepository;
import com.muet.timetable.repository.SubjectRepository;

@Service
@Transactional
public class SubjectDAOImpl implements SubjectDAO {
	
	
	@Autowired
	SubjectRepository subjectrepository;

	public Page<Subject> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return subjectrepository.findAll(pageable);
	}

	public Subject getRecordById(Long id) {
		// TODO Auto-generated method stub
		return subjectrepository.findOne(id);
	}

	public Subject addRecord(Subject subject) {
		// TODO Auto-generated method stub
		
		return subjectrepository.save(subject);
	}

	public int updateRecord(Subject subject) {
		// TODO Auto-generated method stub
		subjectrepository.save(subject);
		
		return 1;
	}

	public int deleteRecord(Subject subject) {
		// TODO Auto-generated method stub
	    subject.setActive(0);
		subjectrepository.save(subject);
		return 1;
	}

	public List<Subject> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Subject>) subjectrepository.findAll();
	}

}
