package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Day;
import com.muet.timetable.dao.DayDAO;
import com.muet.timetable.repository.DayRepository;

@Service
@Transactional
public class DayDAOImpl implements DayDAO {

	
	@Autowired
	DayRepository dayRepository;

	
	public Page<Day> getAllRecords(Pageable pageable) {
		return dayRepository.findAll(pageable);
	}

	public Day getRecordById(Long id) {

		return dayRepository.findOne(id);

	}

	public Day addRecord(Day day) {
		day.setActive(1);
		day.setCreatedBy(1);
		return dayRepository.save(day);
		

	}

	public int updateRecord(Day day) {
		// TODO Auto-generated method stub
		 dayRepository.save(day);
		 return 1;

	}

	public int deleteRecord(Day day) {
		// TODO Auto-generated method stub
		day.setActive(0);
		 dayRepository.save(day);
		 return 1;
	}
	public List<Day> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Day>) dayRepository.findAll();
	}
	
	
}
