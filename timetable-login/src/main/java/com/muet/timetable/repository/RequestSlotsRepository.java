package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.Batch;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.RequestSlots;


public interface RequestSlotsRepository extends PagingAndSortingRepository<RequestSlots, Long> {
	
	
	//@Query("SELECT e FROM Batch e WHERE e.dept=:dept AND e.active=1 ")
	  // List<Batch> getAllRecordsByDept (@Param("dept") Department department);
}
