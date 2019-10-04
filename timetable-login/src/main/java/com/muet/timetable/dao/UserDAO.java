package com.muet.timetable.dao;

import java.util.List;


import com.muet.timetable.beans.User;

public interface UserDAO {
    void save(User user);

    User findByUsername(String username);
	//public List<User> getAllRecords();

}
