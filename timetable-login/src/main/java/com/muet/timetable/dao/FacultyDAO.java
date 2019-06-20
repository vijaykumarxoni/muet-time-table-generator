package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Faculty;

public interface FacultyDAO {

	public Page<Faculty> getAllRecords(Pageable pageable);
	public Faculty getRecordById(Long id);
	public Faculty addRecord(Faculty faculty);
	public int updateRecord(Faculty faculty);
	public int deleteRecord(Faculty faculty);
	public List<Faculty> getAllRecords();

	
	
	
}
