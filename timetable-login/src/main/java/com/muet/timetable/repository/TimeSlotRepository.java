package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.TimeSlot;;

public interface TimeSlotRepository extends PagingAndSortingRepository<TimeSlot, Long>{

}
