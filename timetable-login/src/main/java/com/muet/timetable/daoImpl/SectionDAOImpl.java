package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Section;
import com.muet.timetable.dao.SectionDAO;
import com.muet.timetable.repository.BatchRepository;
import com.muet.timetable.repository.SectionRepository;

@Service
@Transactional
public class SectionDAOImpl implements SectionDAO{

	@Autowired
	SectionRepository sectionrepository;

	public Page<Section> getAllRecords(Pageable pageable) {
		// TODO Auto-generated method stub
		return sectionrepository.findAll(pageable);
	}

	public Section getRecordById(Long id) {
		// TODO Auto-generated method stub
		return sectionrepository.findOne(id);
	}

	public Section addRecord(Section section) {
		// TODO Auto-generated method stub
		section.setActive(1);
		section.setCreatedBy(1);
		return sectionrepository.save(section);
	}

	public int updateRecord(Section section) {
		// TODO Auto-generated method stub
		sectionrepository.save(section);
		return 1;
	}

	public int deleteRecord(Section section) {
		// TODO Auto-generated method stub
		section.setActive(0);
		sectionrepository.save(section);
		return 1;
	}

	public List<Section> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Section>) sectionrepository.findAll();
	}

	@Override
	public List<Section> getAllRecordsByBatch(Batch batch) {
		// TODO Auto-generated method stub
		return (List<Section>) sectionrepository.getSectionsByBatch(batch);
	}

	
	
}
