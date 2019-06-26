package com.muet.timetable.beans;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Where;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;



@Where(clause = "active =1")
@Entity
@Table(name = "time_slot_daily")
@EntityListeners(AuditingEntityListener.class)
public class TimeSlot extends Bean implements Serializable  {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	
	@Column(name = "start_time")
	private String startTime;
	
	

	@Column(name = "end_time")
	private String endTime;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "day_id",referencedColumnName="id")
	private Day day;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "subject_id",referencedColumnName="id")
	private Subject subject;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "batch_id",referencedColumnName="id")
	private Batch batch;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Day getDay() {
		return day;
	}

	public void setDay(Day day) {
		this.day = day;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Batch getBatch() {
		return batch;
	}

	public void setBatch(Batch batch) {
		this.batch = batch;
	}
	
	
	

}
