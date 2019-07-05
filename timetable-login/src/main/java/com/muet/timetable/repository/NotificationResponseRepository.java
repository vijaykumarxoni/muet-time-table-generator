package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.NotificationResponse;

public interface NotificationResponseRepository extends PagingAndSortingRepository<NotificationResponse, Long>{

}
