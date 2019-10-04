package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


import com.muet.timetable.beans.RequestSlots;
import com.muet.timetable.beans.User;

public interface RequestSlotsDAO {
public Page<RequestSlots> getAllRecords(Pageable pageable);
	
	public RequestSlots getRecordById(Long id);
	
	public RequestSlots addRecord(RequestSlots requestSlots);
	
	public int updateRecord(RequestSlots requestSlots);
	
	public int deleteRecord(RequestSlots requestSlots);
	
	public List<RequestSlots> getAllRecords();
	
	public List<RequestSlots> getAllRecordsByUser(User u);
	

	
}
