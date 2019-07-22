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
@Table(name = "notification")
@EntityListeners(AuditingEntityListener.class)

public class NotificationDetails extends Bean implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long   id;
	
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "assign_subject_id",referencedColumnName="id")
	private AssignSubject assignsubject;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "user_id",referencedColumnName="id")
	private User sender;

	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "reciever_id",referencedColumnName="id")
	private User reciver;
	
	@NotNull
	@Column(name = "description")
	private String description;
	
	
	@NotNull
	@Column(name = "datetime")
	private String datetime;
	




	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

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

	

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReciver() {
		return reciver;
	}

	public void setReciver(User reciver) {
		this.reciver = reciver;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	
	

}
