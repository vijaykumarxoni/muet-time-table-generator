package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Role;

public interface RoleDAO {

	public Page<Role> getAllRecords(Pageable pageable);
	public Role getRecordById(Long id);
	public Role addRecord(Role role);
	public int updateRecord(Role role);
	public int deleteRecord(Role role);
	public List<Role> getAllRecords();

	
	
	
}
