package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Teacher;
import com.muet.timetable.dao.AssignSubjectDAO;
import com.muet.timetable.repository.AssignSubjectRepository;
import com.muet.timetable.repository.BatchRepository;

@Service
@Transactional
public class AssignSubjectDAOImpl implements AssignSubjectDAO{
	
	@Autowired
	AssignSubjectRepository assignsubjectrepository;
	
	
	public Page<AssignSubject> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return assignsubjectrepository.findAll(pageable);
	}

	public AssignSubject getRecordById(Long id) {
		// TODO Auto-generated method stub
		return assignsubjectrepository.findOne(id);
	}

	public AssignSubject addRecord(AssignSubject batch) {
		// TODO Auto-generated method stub
		batch.setActive(1);
		batch.setCreatedBy(1);
		return assignsubjectrepository.save(batch);
	}

	public int updateRecord(AssignSubject batch) {
		// TODO Auto-generated method stub
		assignsubjectrepository.save(batch);
		return 1;
	}

	public int deleteRecord(AssignSubject batch) {
		// TODO Auto-generated method stub
		batch.setActive(0);
		assignsubjectrepository.save(batch);
		return 1;
	}

	public List<AssignSubject> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<AssignSubject>) assignsubjectrepository.findAll();
	}

	@Override
	public List<AssignSubject> getAllRecordsByBatchAndSectionAndSemester(Batch batch, Section section,Semester semester) {
		// TODO Auto-generated method stub
		return  assignsubjectrepository.getAllRecordsByBatchAndSectionAndSemester(batch, section,semester);
	}

	@Override
	public List<AssignSubject> getAllRecordsByTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		
		return  assignsubjectrepository.getAllRecordsByTeacher(teacher);
		
	}

	@Override
	public List<AssignSubject> getAllRecordsByBatch(Batch batch) {
		// TODO Auto-generated method stub
		return assignsubjectrepository.getAllRecordsByBatch(batch);
	}
	
	@Override
	public List<AssignSubject> getAllRecordsByDepartment(Department department) {
		// TODO Auto-generated method stub
		return assignsubjectrepository.getAllRecordsByDept(department);
	}

	@Override
	public List<AssignSubject> getAllRecordsByBatchAndSemester(Batch batch, Semester semester) {
		// TODO Auto-generated method stub
		return assignsubjectrepository.getAllRecordsByBatchAndSemester(batch, semester);
	}

}
