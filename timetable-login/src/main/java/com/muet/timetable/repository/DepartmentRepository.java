package com.muet.timetable.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.muet.timetable.beans.Department;

	public interface DepartmentRepository extends PagingAndSortingRepository<Department, Long> {

}
