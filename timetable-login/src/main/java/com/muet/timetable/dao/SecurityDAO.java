package com.muet.timetable.dao;

public interface SecurityDAO {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
