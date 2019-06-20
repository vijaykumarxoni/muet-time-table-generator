package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;

public interface DepartmentDAO {

	public Page<Department> getAllRecords(Pageable pageable);
	public Department getRecordById(Long id);
	public Department addRecord(Department Department);
	public int updateRecord(Department Department);
	public int deleteRecord(Department Department);
	public List<Department> getAllRecords();

	
	
	
}
