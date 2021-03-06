package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;

public interface SubjectDAO {
	
	
	 public Page<Subject> getAllRecords(Department department,Pageable pageable);
		
		public Subject getRecordById(Long id);
		
		
		
		public Subject addRecord(Subject subject);
		
		public int updateRecord(Subject subject);
		
		public int deleteRecord(Subject subject);
		
		public Page<Subject> getAllRecords(Pageable pageable);
		public List<Subject> getAllRecords();
		
		public List<Subject> getAllRecordsBySemester(Long id);
		
		
		public int getCreaditHour(Department department, Semester semester);
	
		public List<Subject> getAllRecordsByDept(Department department);


}
