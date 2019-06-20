package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.Day;
import com.muet.timetable.beans.Subject;

public interface SubjectRepository extends PagingAndSortingRepository<Subject, Long> {

}
