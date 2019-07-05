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
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Where;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;



@Where(clause = "active =1")
@Entity
@Table(name = "timetablewithoutroom")
@EntityListeners(AuditingEntityListener.class)
public class TimeTableWithoutRoom extends Bean implements Serializable {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long   id;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "assign_subject_id",referencedColumnName="id")
	private AssignSubject assignsubject;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "day_id",referencedColumnName="id")
	private Day day;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "time_slot_id",referencedColumnName="id")
	private TimeSlot timeslot;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public AssignSubject getAssignsubject() {
		return assignsubject;
	}

	public void setAssignsubject(AssignSubject assignsubject) {
		this.assignsubject = assignsubject;
	}

	public Day getDay() {
		return day;
	}

	public void setDay(Day day) {
		this.day = day;
	}

	public TimeSlot getTimeslot() {
		return timeslot;
	}

	public void setTimeslot(TimeSlot timeslot) {
		this.timeslot = timeslot;
	}

	
	
	
	
}
