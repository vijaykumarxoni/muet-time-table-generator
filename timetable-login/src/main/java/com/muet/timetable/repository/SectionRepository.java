package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Section;

public interface SectionRepository extends PagingAndSortingRepository<Section, Long>{

}
