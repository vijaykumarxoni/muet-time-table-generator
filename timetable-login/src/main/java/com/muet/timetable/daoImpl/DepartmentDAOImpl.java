package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Department;
import com.muet.timetable.dao.DepartmentDAO;
import com.muet.timetable.repository.DepartmentRepository;

@Service
@Transactional
public class DepartmentDAOImpl implements DepartmentDAO {

	
	@Autowired
	DepartmentRepository departmentRepository;

	
	public Page<Department> getAllRecords(Pageable pageable) {
		return departmentRepository.findAll(pageable);
	}

	public Department getRecordById(Long id) {

		return departmentRepository.findOne(id);

	}

	public Department addRecord(Department department) {
		department.setActive(1);
		department.setCreatedBy(1);
		return departmentRepository.save(department);
		

	}

	public int updateRecord(Department department) {
		// TODO Auto-generated method stub
		departmentRepository.save(department);
		 return 1;

	}

	public int deleteRecord(Department department) {
		// TODO Auto-generated method stub
		department.setActive(0);
		departmentRepository.save(department);
		 return 1;
	}

	public List<Department> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Department>) departmentRepository.findAll();
	}
	
	
}
