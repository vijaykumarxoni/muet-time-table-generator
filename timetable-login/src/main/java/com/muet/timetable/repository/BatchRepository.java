package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.Batch;

import com.muet.timetable.beans.Department;


public interface BatchRepository extends PagingAndSortingRepository<Batch, Long> {
	
	
	@Query("SELECT e FROM Batch e WHERE e.dept=:dept AND e.active=1 ")
	   List<Batch> getAllRecordsByDept (@Param("dept") Department department);
	
	@Query("SELECT e FROM Batch e WHERE e.dept=:dept AND e.active=1 ")
	   Page<Batch> getAllRecordsByDept (@Param("dept") Department department, org.springframework.data.domain.Pageable pageable);

	
}
