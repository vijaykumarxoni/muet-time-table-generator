package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Room;

	public interface RoomRepository extends PagingAndSortingRepository<Room, Long> {

		
		
		@Query("SELECT e FROM Room e WHERE e.department=:department AND e.active=1 ")
		   List<Room> getAllRecordsByDept (@Param("department") Department department);
		
		@Query("SELECT e FROM Room e WHERE e.department=:department AND e.active=1 ")
		   Page<Room> getAllRecordsByDept (@Param("department") Department department, org.springframework.data.domain.Pageable pageable);


		
}
