package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.Batch;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.RequestSlots;
import com.muet.timetable.beans.User;


public interface RequestSlotsRepository extends PagingAndSortingRepository<RequestSlots, Long> {
	
	
		@Query("SELECT e FROM RequestSlots e WHERE e.user=:user AND e.active=1 ")
	   List<RequestSlots> getAllRecordsByUser (@Param("user") User user );
}
