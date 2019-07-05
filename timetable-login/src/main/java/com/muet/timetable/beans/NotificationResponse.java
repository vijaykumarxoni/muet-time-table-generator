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
@Table(name = "notificationresponse")
@EntityListeners(AuditingEntityListener.class)
public class NotificationResponse extends Bean implements Serializable{
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long   id;
	
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "assign_subject_id",referencedColumnName="id")
	private AssignSubject assignsubject;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "sender_id",referencedColumnName="id")
	private Teacher teacher;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "reciever_id",referencedColumnName="id")
	private User user_sender;
	
	@NotNull
	@Column(name = "description")
	private String description;

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

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public User getUser_sender() {
		return user_sender;
	}

	public void setUser_sender(User user_sender) {
		this.user_sender = user_sender;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	

}
