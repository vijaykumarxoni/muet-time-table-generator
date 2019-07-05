package com.muet.timetable.repository;
import java.util.ArrayList;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.TimeSlotDaily;

public interface TimeSlotDailyRepository extends PagingAndSortingRepository<TimeSlotDaily, Long> {
	
	
	 @Query("SELECT tsd.totalSlots FROM TimeSlotDaily tsd INNER JOIN tsd.day d  WHERE  d.name='Friday' ")
	    int getTimeSlotsForFriday ();
	 
	 @Query("SELECT tsd FROM TimeSlotDaily tsd INNER JOIN tsd.day d  WHERE  d.name<>'Friday' ")
	    ArrayList<TimeSlotDaily> getTimeSlotsForRegular ();

}

