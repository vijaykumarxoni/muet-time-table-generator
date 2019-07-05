package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.NotificationResponse;
import com.muet.timetable.repository.NotificationResponseRepository;;

@Service
@Transactional
public class NotificationResponseDAOImpl {
	
	@Autowired
	NotificationResponseRepository notificationresponserepository;
	
	
	public Page<NotificationResponse> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return notificationresponserepository.findAll(pageable);
	}

	public NotificationResponse getRecordById(Long id) {
		// TODO Auto-generated method stub
		return notificationresponserepository.findOne(id);
	}

	public NotificationResponse addRecord(NotificationResponse notificationresponse) {
		// TODO Auto-generated method stub
		notificationresponse.setActive(1);
		notificationresponse.setCreatedBy(1);
		return notificationresponserepository.save(notificationresponse);
	}

	public int updateRecord(NotificationResponse notificationresponse) {
		// TODO Auto-generated method stub
		notificationresponserepository.save(notificationresponse);
		return 1;
	}

	public int deleteRecord(NotificationResponse notificationresponse) {
		// TODO Auto-generated method stub
		notificationresponse.setActive(0);
		notificationresponserepository.save(notificationresponse);
		return 1;
	}

	public List<NotificationResponse> getAllRecords() {
		// TODO Auto-generated method stub
	
		return (List<NotificationResponse>) notificationresponserepository.findAll();
	}

}
