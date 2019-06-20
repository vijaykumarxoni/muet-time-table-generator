package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Semester;

public interface SemesterRepository extends PagingAndSortingRepository<Semester, Long> {

}
