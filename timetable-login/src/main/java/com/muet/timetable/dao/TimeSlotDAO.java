package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.TimeSlot;

public interface TimeSlotDAO {
	
	
public Page<TimeSlot> getAllRecords(Pageable pageable);
	
	public TimeSlot getRecordById(Long id);
	
	public TimeSlot addRecord(TimeSlot timeslot);
	
	public int updateRecord(TimeSlot timeslot);
	
	public int deleteRecord(TimeSlot timeslot);
	
	public List<TimeSlot> getAllRecords();

}
