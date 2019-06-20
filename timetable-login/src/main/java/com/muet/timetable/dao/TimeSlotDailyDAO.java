package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.TimeSlotDaily;

public interface TimeSlotDailyDAO {

	public Page<TimeSlotDaily> getAllRecords(Pageable pageable);
	public TimeSlotDaily getRecordById(Long id);
	public TimeSlotDaily addRecord(TimeSlotDaily timeSlotDaily);
	public int updateRecord(TimeSlotDaily timeSlotDaily);
	public int deleteRecord(TimeSlotDaily timeSlotDaily);
	public List<TimeSlotDaily> getAllRecords();

	
	
	
}
