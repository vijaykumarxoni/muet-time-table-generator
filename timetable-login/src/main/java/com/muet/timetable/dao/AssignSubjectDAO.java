package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Teacher;;

public interface AssignSubjectDAO {

public Page<AssignSubject> getAllRecords(Pageable pageable);
	
	public AssignSubject getRecordById(Long id);
	
	public AssignSubject addRecord(AssignSubject batch);
	
	public int updateRecord(AssignSubject batch);
	
	public int deleteRecord(AssignSubject batch);
	
	public List<AssignSubject> getAllRecords();
	
	
	public List<AssignSubject> getAllRecordsByBatchAndSectionAndSemester(Batch batch , Section section,Semester semester);
	public List<AssignSubject> getAllRecordsByBatchAndSemester(Batch batch , Semester semester);

	public List<AssignSubject> getAllRecordsByBatch ( Batch batch);
	public List<AssignSubject> getAllRecordsByDepartment (Department department);
	
	public List<AssignSubject> getAllRecordsByTeacher(Teacher teacher);
	

	
}
