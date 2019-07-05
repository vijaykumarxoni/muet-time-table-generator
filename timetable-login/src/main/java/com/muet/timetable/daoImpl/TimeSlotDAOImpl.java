package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.TimeSlot;
import com.muet.timetable.repository.AssignSubjectRepository;
import com.muet.timetable.repository.TimeSlotRepository;

@Service
@Transactional
public class TimeSlotDAOImpl {
	
	@Autowired
	TimeSlotRepository timeslotrepository;
	
	
	public Page<TimeSlot> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return timeslotrepository.findAll(pageable);
	}

	public TimeSlot getRecordById(Long id) {
		// TODO Auto-generated method stub
		return timeslotrepository.findOne(id);
	}

	public TimeSlot addRecord(TimeSlot timeslot) {
		// TODO Auto-generated method stub
		timeslot.setActive(1);
		timeslot.setCreatedBy(1);
		return timeslotrepository.save(timeslot);
	}

	public int updateRecord(TimeSlot timeslot) {
		// TODO Auto-generated method stub
		timeslotrepository.save(timeslot);
		return 1;
	}

	public int deleteRecord(TimeSlot timeslot) {
		// TODO Auto-generated method stub
		timeslot.setActive(0);
		timeslotrepository.save(timeslot);
		return 1;
	}

	public List<TimeSlot> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<TimeSlot>) timeslotrepository.findAll();
	}

	

}
