package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.NotificationResponse;;

public interface NotificationResponseDAO {

	 public Page<NotificationResponse> getAllRecords(Pageable pageable);
		
		public NotificationResponse getRecordById(Long id);
		
		public NotificationResponse addRecord(NotificationResponse notificationresponse);
		
		public int updateRecord(NotificationResponse notificationresponse);
		
		public int deleteRecord(NotificationResponse notificationresponse);
		
		public List<NotificationResponse> getAllRecords();
	
}
