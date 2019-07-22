package com.muet.timetable.daoImpl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.muet.timetable.beans.Role;
import com.muet.timetable.beans.User;
import com.muet.timetable.dao.UserDAO;
import com.muet.timetable.repository.RoleRepository;
import com.muet.timetable.repository.UserRepository;

import java.util.HashSet;

@Service
public class UserDAOImpl implements UserDAO {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
