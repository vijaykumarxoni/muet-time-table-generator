package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.dao.NotificationDetailsDAO;
import com.muet.timetable.repository.AssignSubjectRepository;
import com.muet.timetable.repository.NotificationDetailsRepository;

@Service
@Transactional
public class NotificationDetailsDAOImpl implements NotificationDetailsDAO {
	
	@Autowired
	NotificationDetailsRepository notificationdetailsrepository;
	
	public Page<NotificationDetails> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return notificationdetailsrepository.findAll(pageable);
	}

	public NotificationDetails getRecordById(Long id) {
		// TODO Auto-generated method stub
		return notificationdetailsrepository.findOne(id);
	}

	public NotificationDetails addRecord(NotificationDetails notificationdetails) {
		// TODO Auto-generated method stub
		notificationdetails.setActive(1);
		notificationdetails.setCreatedBy(1);
		return notificationdetailsrepository.save(notificationdetails);
	}

	public int updateRecord(NotificationDetails notificationdetails) {
		// TODO Auto-generated method stub
		notificationdetailsrepository.save(notificationdetails);
		return 1;
	}

	public int deleteRecord(NotificationDetails notificationdetails) {
		// TODO Auto-generated method stub
		notificationdetails.setActive(0);
		notificationdetailsrepository.save(notificationdetails);
		return 1;
	}

	public List<NotificationDetails> getAllRecords() {
		// TODO Auto-generated method stub
		System.out.println("The function is called");
		return (List<NotificationDetails>) notificationdetailsrepository.findAll();
	}

}
