package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Day;

public interface BatchRepository extends PagingAndSortingRepository<Batch, Long> {

}
