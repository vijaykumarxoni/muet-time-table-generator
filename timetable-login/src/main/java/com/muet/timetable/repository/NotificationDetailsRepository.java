package com.muet.timetable.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.muet.timetable.beans.AssignSubject;
import com.muet.timetable.beans.Batch;
import com.muet.timetable.beans.NotificationDetails;
import com.muet.timetable.beans.Section;;

public interface NotificationDetailsRepository extends PagingAndSortingRepository<NotificationDetails, Long>{
//SELECT * FROM notification WHERE assign_subject_id=1 ORDER BY DATETIME ASC
	
	
	 @Query("SELECT e FROM NotificationDetails e WHERE e.assignsubject=:assignsubject ORDER BY DATETIME ASC ")
	   List<NotificationDetails> getNotificationByAssignSubject (@Param("assignsubject") AssignSubject assignSubject);

}
