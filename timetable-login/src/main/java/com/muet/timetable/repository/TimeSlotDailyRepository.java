package com.muet.timetable.repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.TimeSlotDaily;

public interface TimeSlotDailyRepository extends PagingAndSortingRepository<TimeSlotDaily, Long> {

}

