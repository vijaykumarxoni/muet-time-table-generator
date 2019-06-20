package com.muet.timetable.dao;

import com.muet.timetable.beans.User;

public interface UserDAO {
    void save(User user);

    User findByUsername(String username);
}
