package com.muet.timetable.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Role;
import com.muet.timetable.dao.RoleDAO;
import com.muet.timetable.repository.RoleRepository;

@Service
@Transactional
public class RoleDAOImpl implements RoleDAO {

	
	@Autowired
	RoleRepository roleRepository;

	
	public Page<Role> getAllRecords(Pageable pageable) {
		return roleRepository.findAll(pageable);
	}

	public Role getRecordById(Long id) {

		return roleRepository.findOne(id);

	}

	public Role addRecord(Role role) {
		role.setActive(1);
		role.setCreatedBy(1);
		return roleRepository.save(role);
		

	}

	public int updateRecord(Role role) {
		// TODO Auto-generated method stub
		roleRepository.save(role);
		 return 1;

	}

	public int deleteRecord(Role role) {
		// TODO Auto-generated method stub
		role.setActive(0);
		roleRepository.save(role);
		 return 1;
	}
	public List<Role> getAllRecords() {
		// TODO Auto-generated method stub
		return (List<Role>) roleRepository.findAll();
	}
	
	
}
