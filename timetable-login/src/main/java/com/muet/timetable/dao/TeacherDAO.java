package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Teacher;

public interface TeacherDAO {

	public Page<Teacher> getAllRecords(Department department,Pageable pageable);
	public Teacher getRecordById(Long id);
	public Teacher addRecord(Teacher teacher);
	public int updateRecord(Teacher teacher);
	public int deleteRecord(Teacher teacher);
	public List<Teacher> getAllRecords();
	public List<Teacher> getAllRecordsByDepartment(Department depart);
	public Teacher getRecordByNameDeptEmailContact(String name,Department department,String email,String contact);

	
}
