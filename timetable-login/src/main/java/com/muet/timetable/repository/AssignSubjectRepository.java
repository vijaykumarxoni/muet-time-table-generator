package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Teacher;


public interface AssignSubjectRepository extends PagingAndSortingRepository<AssignSubject, Long> {
	
	 @Query("SELECT e FROM AssignSubject e WHERE e.batch=:batch  and  e.section=:section")
	   List<AssignSubject> getAllRecordsByBatchAndSection (@Param("batch") Batch batch ,@Param("section") Section section);
	 
	 
	 @Query("SELECT e FROM AssignSubject e WHERE e.teacher=:teacher order by e.id desc ")
	   List<AssignSubject> getAllRecordsByTeacher (@Param("teacher") Teacher teacher );
	 
	 
	 
}
