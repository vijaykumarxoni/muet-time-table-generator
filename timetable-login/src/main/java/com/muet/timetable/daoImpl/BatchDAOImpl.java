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
import com.muet.timetable.dao.BatchDAO;
import com.muet.timetable.repository.BatchRepository;
import com.muet.timetable.repository.DayRepository;

@Service
@Transactional
public class BatchDAOImpl implements BatchDAO {
	
	@Autowired
	BatchRepository batchrepository;

	public Page<Batch> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return batchrepository.findAll(pageable);
	}

	public Batch getRecordById(Long id) {
		// TODO Auto-generated method stub
		return batchrepository.findOne(id);
	}

	public Batch addRecord(Batch batch) {
		// TODO Auto-generated method stub
		batch.setActive(1);
		batch.setCreatedBy(1);
		return batchrepository.save(batch);
	}

	public int updateRecord(Batch batch) {
		// TODO Auto-generated method stub
		batchrepository.save(batch);
		return 1;
	}

	public int deleteRecord(Batch batch) {
		// TODO Auto-generated method stub
		batch.setActive(0);
		batchrepository.save(batch);
		return 1;
	}

	public List<Batch> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Batch>) batchrepository.findAll();
	}

	@Override
	public List<Batch> getAllRecordsByDept(Department department) {
		// TODO Auto-generated method stub
		return (List<Batch>) batchrepository.getAllRecordsByDept(department);
	}

}
