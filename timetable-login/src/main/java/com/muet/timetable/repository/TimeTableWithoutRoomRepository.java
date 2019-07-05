package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.TimeTableWithoutRoom;

public interface TimeTableWithoutRoomRepository extends PagingAndSortingRepository<TimeTableWithoutRoom, Long>{

	
	 @Query("SELECT e FROM TimeTableWithoutRoom e WHERE e.assignsubject=:assignsubject ")
	   List<TimeTableWithoutRoom> get (@Param("assignsubject") AssignSubject assignSubject);
}
