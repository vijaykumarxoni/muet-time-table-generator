package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Semester;

public interface SemesterDAO {
	
	
    public Page<Semester> getAllRecords(Pageable pageable);
	
	public Semester getRecordById(Long id);
	
	public Semester addRecord(Semester semester);
	
	public int updateRecord(Semester semester);
	
	public int deleteRecord(Semester semester);
	
	public List<Semester> getAllRecords();
	
	
	

}
