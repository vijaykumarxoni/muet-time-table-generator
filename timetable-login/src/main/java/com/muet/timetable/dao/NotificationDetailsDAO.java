package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.NotificationDetails;;

public interface NotificationDetailsDAO {
	
public Page<NotificationDetails> getAllRecords(Pageable pageable);
	
	public NotificationDetails getRecordById(Long id);
	
	public NotificationDetails addRecord(NotificationDetails notificationdetails);
	
	public int updateRecord(NotificationDetails notificationdetails);
	
	public int deleteRecord(NotificationDetails notificationdetails);
	
	public List<NotificationDetails> getAllRecords();

}
