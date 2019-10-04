package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.TimeTableWithoutRoom;;

public interface TimeTableWithoutRoomDAO {

	
	
public Page<TimeTableWithoutRoom> getAllRecords(Pageable pageable);
	
	public TimeTableWithoutRoom getRecordById(Long id);
	
	public TimeTableWithoutRoom addRecord(TimeTableWithoutRoom timetablewithoutroom);
	
	public int updateRecord(TimeTableWithoutRoom timetablewithoutroom);
	
	public int deleteRecord(TimeTableWithoutRoom timetablewithoutroom);
	public int deleteCommited(long id);
	
	
	public List<TimeTableWithoutRoom> getAllRecords();
	
	public List<TimeTableWithoutRoom> getAllRecordsByAssignSubject(AssignSubject assignSubject);
	
	
}
