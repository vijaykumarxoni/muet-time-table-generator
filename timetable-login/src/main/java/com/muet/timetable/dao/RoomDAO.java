package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.Room;

public interface RoomDAO {

	public Page<Room> getAllRecords(Department department,Pageable pageable);
	public Room getRecordById(Long id);
	public Room addRecord(Room room);
	public int updateRecord(Room room);
	public int deleteRecord(Room room);
	public List<Room> getAllRecords();
	public List<Room> getAllRecordsByDept(Department department);
	
	
}
