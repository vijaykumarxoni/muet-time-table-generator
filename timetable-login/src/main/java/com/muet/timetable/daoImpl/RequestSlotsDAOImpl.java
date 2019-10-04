package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.RequestSlots;
import com.muet.timetable.beans.User;
import com.muet.timetable.dao.BatchDAO;
import com.muet.timetable.dao.RequestSlotsDAO;
import com.muet.timetable.repository.BatchRepository;
import com.muet.timetable.repository.DayRepository;
import com.muet.timetable.repository.RequestSlotsRepository;

@Service
@Transactional
public class RequestSlotsDAOImpl implements RequestSlotsDAO {
	
	@Autowired
	RequestSlotsRepository requestSlotsRepository;

	public Page<RequestSlots> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return requestSlotsRepository.findAll(pageable);
	}

	public RequestSlots getRecordById(Long id) {
		// TODO Auto-generated method stub
		return requestSlotsRepository.findOne(id);
	}

	public RequestSlots addRecord(RequestSlots requestSlots) {
		// TODO Auto-generated method stub
		requestSlots.setActive(1);
		requestSlots.setCreatedBy(1);
		return requestSlotsRepository.save(requestSlots);
	}

	public int updateRecord(RequestSlots requestSlots) {
		// TODO Auto-generated method stub
		requestSlotsRepository.save(requestSlots);
		return 1;
	}

	public int deleteRecord(RequestSlots requestSlots) {
		// TODO Auto-generated method stub
		requestSlots.setActive(0);
		requestSlotsRepository.save(requestSlots);
		return 1;
	}

	public List<RequestSlots> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<RequestSlots>) requestSlotsRepository.findAll();
	}

	@Override
	public List<RequestSlots> getAllRecordsByUser(User u) {
		// TODO Auto-generated method stub
		return (List<RequestSlots>) requestSlotsRepository.getAllRecordsByUser(u);
	}


}
