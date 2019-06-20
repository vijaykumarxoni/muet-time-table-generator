package com.muet.timetable;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;




@SpringBootApplication(scanBasePackages={"com.example.something", "com.muet.timetable"})
public class RoomApplication{
	/*
	 @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	        return application.sources(RoomApplication.class);
	    }*/
	
	public static void main(String args[]) throws Exception {
		SpringApplication.run(RoomApplication.class, args);
		
	}
}
