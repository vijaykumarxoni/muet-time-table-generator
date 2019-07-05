package com.muet.timetable.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Semester;
import com.muet.timetable.beans.Subject;

public interface SubjectRepository extends PagingAndSortingRepository<Subject, Long> {

	 @Query("SELECT SUM(u.credit_hour) FROM Subject u WHERE u.dept=:deptartment and u.semester=:semester ")
	    int getCredit_hours (@Param("deptartment") Department department,@Param("semester") Semester semester);
		  
	  

}
