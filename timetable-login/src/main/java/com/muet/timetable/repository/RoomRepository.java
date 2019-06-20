package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.Department;
import com.muet.timetable.beans.Room;

	public interface RoomRepository extends PagingAndSortingRepository<Room, Long> {

}
