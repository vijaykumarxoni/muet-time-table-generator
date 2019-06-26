package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.AssignSubject;;

public interface AssignSubjectDAO {

public Page<AssignSubject> getAllRecords(Pageable pageable);
	
	public AssignSubject getRecordById(Long id);
	
	public AssignSubject addRecord(AssignSubject batch);
	
	public int updateRecord(AssignSubject batch);
	
	public int deleteRecord(AssignSubject batch);
	
	public List<AssignSubject> getAllRecords();
	
	
	
}
