package com.muet.timetable.beans;

public class DaySlot {

	private Integer dayId;
	private Integer numOfSlots;
	public Integer getDayId() {
		return dayId;
	}
	public void setDayId(Integer dayId) {
		this.dayId = dayId;
	}
	public Integer getNumOfSlots() {
		return numOfSlots;
	}
	public void setNumOfSlots(Integer numOfSlots) {
		this.numOfSlots = numOfSlots;
	}
	public DaySlot(Integer dayId, Integer numOfSlots) {
		super();
		this.dayId = dayId;
		this.numOfSlots = numOfSlots;
	}
	@Override
	public String toString() {
		return "DaySlot [dayId=" + dayId + ", numOfSlots=" + numOfSlots + "]";
	}
	

	
}
