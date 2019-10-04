package com.muet.timetable.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.TimeTableWithoutRoom;

public interface TimeTableWithoutRoomRepository extends PagingAndSortingRepository<TimeTableWithoutRoom, Long>{

	
	 @Query("SELECT e FROM TimeTableWithoutRoom e WHERE e.assignsubject=:assignsubject ")
	   List<TimeTableWithoutRoom> get (@Param("assignsubject") AssignSubject assignSubject);
	 
	 
	 @Transactional
	 @Modifying
	 @Query("DELETE FROM TimeTableWithoutRoom e WHERE e.id=:id  AND e.outsider=0 and e.commited=1")
	 int deleteCommited (@Param("id") long id);
}
