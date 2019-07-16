package com.muet.timetable.beans;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class Sidebar {

	
	@Value("#{'${my.list.of.strings}'.split(',')}") 
	private List<String> myList;

	public List<String> getMyList() {
		return myList;
	}

	public void setMyList(List<String> myList) {
		this.myList = myList;
	}
	
	
	
	
}
