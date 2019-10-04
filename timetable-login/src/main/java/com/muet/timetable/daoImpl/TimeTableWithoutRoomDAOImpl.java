package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.TimeTableWithoutRoom;
import com.muet.timetable.repository.AssignSubjectRepository;
import com.muet.timetable.repository.TimeTableWithoutRoomRepository;

@Service
@Transactional
public class TimeTableWithoutRoomDAOImpl {
	
	
	@Autowired
	TimeTableWithoutRoomRepository timetablewithoutrepository;
	
	
	public Page<TimeTableWithoutRoom> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return timetablewithoutrepository.findAll(pageable);
	}

	public TimeTableWithoutRoom getRecordById(Long id) {
		// TODO Auto-generated method stub
		return timetablewithoutrepository.findOne(id);
	}
	
	public TimeTableWithoutRoom addRecord(TimeTableWithoutRoom timetablewithoutroom) {
		// TODO Auto-generated method stub
		timetablewithoutroom.setActive(1);
		timetablewithoutroom.setCreatedBy(1);
		return timetablewithoutrepository.save(timetablewithoutroom);
	}

	public int updateRecord(TimeTableWithoutRoom batch) {
		// TODO Auto-generated method stub
		timetablewithoutrepository.save(batch);
		return 1;
	}

	public int deleteRecord(TimeTableWithoutRoom timetablewithoutroom) {
		// TODO Auto-generated method stub
		timetablewithoutroom.setActive(0);
		timetablewithoutrepository.save(timetablewithoutroom);
		return 1;
	}

	public List<TimeTableWithoutRoom> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<TimeTableWithoutRoom>) timetablewithoutrepository.findAll();
	}
	
	
	public List<TimeTableWithoutRoom> getAllRecordsByAssignSubject(AssignSubject assignSubject) {
		// TODO Auto-generated method stub
		return (List<TimeTableWithoutRoom>) timetablewithoutrepository.get(assignSubject);
	}
	

	public int deleteCommited(long id) {
		// TODO Auto-generated method stub

		timetablewithoutrepository.deleteCommited(id);
		return 1;
	}

	

	
	

}
