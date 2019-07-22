package com.muet.timetable.repository;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Faculty;
import com.muet.timetable.beans.Teacher;

public interface TeacherRepository extends PagingAndSortingRepository<Teacher, Long> {

	@Query("SELECT e FROM Teacher e WHERE e.dept=:dept AND e.active=1 ")
	   List<Teacher> getAllRecordsByDept (@Param("dept") Department department);

	
	@Query("SELECT e FROM Teacher e WHERE e.dept=:dept AND e.active=1 ")
	   Page<Teacher> getAllRecordsByDept (@Param("dept") Department department, org.springframework.data.domain.Pageable pageable);

	
	@Query("SELECT e FROM Teacher e WHERE e.dept=:dept AND e.active=1 AND e.name=:name "
			+ " AND e.email=:email AND e.contact=:contact   ")
	   Teacher getAllRecordsByNameEmailDeptContact (
			   @Param("name") String  name,
			   @Param("dept") Department department,
			   @Param("email") String  email,
			   @Param("contact") String  contact
			   
			   
			   );

	
}


