package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.Batch;

import com.muet.timetable.beans.Section;

public interface SectionRepository extends PagingAndSortingRepository<Section, Long>{
	
	 @Query("SELECT e FROM Section e WHERE e.batch=:batch ")
	   List<Section> getSectionsByBatch (@Param("batch") Batch batch);
	
}
