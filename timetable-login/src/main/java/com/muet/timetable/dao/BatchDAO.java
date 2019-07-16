package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Department;

public interface BatchDAO {

	
	public Page<Batch> getAllRecords(Pageable pageable);
	
	public Batch getRecordById(Long id);
	
	public Batch addRecord(Batch batch);
	
	public int updateRecord(Batch batch);
	
	public int deleteRecord(Batch batch);
	
	public List<Batch> getAllRecords();
	
	public List<Batch> getAllRecordsByDept(Department department);
	
	
	
	
}
