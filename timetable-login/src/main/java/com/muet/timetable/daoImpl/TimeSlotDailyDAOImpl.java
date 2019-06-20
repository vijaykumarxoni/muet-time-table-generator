package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.TimeSlotDaily;
import com.muet.timetable.dao.TimeSlotDailyDAO;
import com.muet.timetable.dao.TimeSlotDailyDAO;
import com.muet.timetable.repository.TimeSlotDailyRepository;

@Service
@Transactional
public class TimeSlotDailyDAOImpl implements TimeSlotDailyDAO {

	
	@Autowired
	TimeSlotDailyRepository TimeSlotDailyRepository;

	
	public Page<TimeSlotDaily> getAllRecords(Pageable pageable) {
		return TimeSlotDailyRepository.findAll(pageable);
	}

	public TimeSlotDaily getRecordById(Long id) {

		return TimeSlotDailyRepository.findOne(id);

	}

	public TimeSlotDaily addRecord(TimeSlotDaily timeSlotDaily) {
		timeSlotDaily.setCreatedBy(1);
		return TimeSlotDailyRepository.save(timeSlotDaily);
		

	}

	public int updateRecord(TimeSlotDaily timeSlotDaily) {
		// TODO Auto-generated method stub
		 TimeSlotDailyRepository.save(timeSlotDaily);
		 return 1;

	}

	public int deleteRecord(TimeSlotDaily timeSlotDaily) {
		// TODO Auto-generated method stub
		timeSlotDaily.setActive(0);
		 TimeSlotDailyRepository.save(timeSlotDaily);
		 return 1;
	}

	public List<TimeSlotDaily> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<TimeSlotDaily>) TimeSlotDailyRepository.findAll();
	}
	
	
}
