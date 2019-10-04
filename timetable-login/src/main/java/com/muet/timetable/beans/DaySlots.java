package com.muet.timetable.beans;

import java.util.ArrayList;

public class DaySlots {
	
	Day day;
	ArrayList<Integer> slots;
	public Day getDay() {
		return day;
	}
	public void setDay(Day day) {
		this.day = day;
	}
	public ArrayList<Integer> getSlots() {
		return slots;
	}
	public void setSlots(ArrayList<Integer> slots) {
		this.slots = slots;
	}
	@Override
	public String toString() {
		return "DaySlots [day=" + day.getName() + ", slots=" + slots + "]";
	}
	
	
	

}
