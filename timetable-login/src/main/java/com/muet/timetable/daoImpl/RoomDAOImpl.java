package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Room;
import com.muet.timetable.dao.RoomDAO;
import com.muet.timetable.repository.RoomRepository;

@Service
@Transactional
public class RoomDAOImpl implements RoomDAO {

	
	@Autowired
	RoomRepository roomRepository;

	
	public Page<Room> getAllRecords(Department department,Pageable pageable) {
		return roomRepository.getAllRecordsByDept(department, pageable);
	}

	public Room getRecordById(Long id) {

		return roomRepository.findOne(id);

	}

	public Room addRecord(Room room) {
		room.setActive(1);
		room.setCreatedBy(1);
		return roomRepository.save(room);
		

	}

	public int updateRecord(Room room) {
		// TODO Auto-generated method stub
		 roomRepository.save(room);
		 return 1;

	}

	public int deleteRecord(Room room) {
		// TODO Auto-generated method stub
		room.setActive(0);
		 roomRepository.save(room);
		 return 1;
	}

	public List<Room> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Room>) roomRepository.findAll();
	}

	@Override
	public List<Room> getAllRecordsByDept(Department department) {
		// TODO Auto-generated method stub
        return roomRepository.getAllRecordsByDept(department);
	}
	
	
}
