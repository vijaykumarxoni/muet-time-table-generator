package com.muet.timetable.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Section;

public interface SectionDAO {

	
public Page<Section> getAllRecords(Pageable pageable);
	
	public Section getRecordById(Long id);
	
	public Section addRecord(Section section);
	
	public int updateRecord(Section section);
	
	public int deleteRecord(Section batch);
	
	public List<Section> getAllRecords();
	
	public List<Section> getAllRecordsByBatch(Batch batch);
	
	
	
}
