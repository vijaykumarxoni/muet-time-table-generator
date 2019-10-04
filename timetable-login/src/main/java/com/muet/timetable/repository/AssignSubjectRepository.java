package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Room;
import com.muet.timetable.beans.Section;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Teacher;


public interface AssignSubjectRepository extends PagingAndSortingRepository<AssignSubject, Long> {
	
	 @Query("SELECT e FROM AssignSubject e WHERE e.batch=:batch  and  e.section=:section and e.semester=:semester ")
	   List<AssignSubject> getAllRecordsByBatchAndSectionAndSemester (@Param("batch") Batch batch ,@Param("section") Section section,@Param("semester") Semester semester);
	 
	 @Query("SELECT e FROM AssignSubject e WHERE e.batch=:batch  and e.semester=:semester  ")
	   List<AssignSubject> getAllRecordsByBatchAndSemester (@Param("batch") Batch batch ,@Param("semester") Semester semester);
	 
	 
	 @Query("SELECT e FROM AssignSubject e WHERE e.teacher=:teacher order by e.id desc ")
	   List<AssignSubject> getAllRecordsByTeacher (@Param("teacher") Teacher teacher );
	 
	 @Query("SELECT e FROM AssignSubject e WHERE e.batch=:batch AND e.active=1 ")
	   List<AssignSubject> getAllRecordsByBatch (@Param("batch") Batch batch);
	 
	 @Query("SELECT e FROM AssignSubject e WHERE e.department=:department AND e.active=1 ")
	   List<AssignSubject> getAllRecordsByDept (@Param("department") Department department);
	 
}
