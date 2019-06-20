package com.muet.timetable.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.muet.timetable.beans.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
