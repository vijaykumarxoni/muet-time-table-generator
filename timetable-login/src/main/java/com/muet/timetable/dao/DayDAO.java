package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Day;

public interface DayDAO {

	public Page<Day> getAllRecords(Pageable pageable);
	public Day getRecordById(Long id);
	public Day addRecord(Day Day);
	public int updateRecord(Day Day);
	public int deleteRecord(Day Day);
	public List<Day> getAllRecords();

	
	
	
}
