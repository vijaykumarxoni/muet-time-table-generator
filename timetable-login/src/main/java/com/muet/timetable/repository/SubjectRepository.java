package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;

public interface SubjectRepository extends PagingAndSortingRepository<Subject, Long> {

	 @Query("SELECT SUM(u.credit_hour) FROM Subject u WHERE u.dept=:deptartment and u.semester=:semester ")
	    int getCredit_hours (@Param("deptartment") Department department,@Param("semester") Semester semester);
		  
	  
		
		@Query("SELECT e FROM Subject e WHERE e.dept=:dept AND e.active=1 ")
		   List<Subject> getAllRecordsByDept (@Param("dept") Department department);
		
		@Query("SELECT e FROM Subject e WHERE e.dept=:dept AND e.active=1 ")
		   Page<Subject> getAllRecordsByDept (@Param("dept") Department department, org.springframework.data.domain.Pageable pageable);

	 
	 

}
