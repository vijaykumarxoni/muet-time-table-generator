package com.muet.timetable.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.annotations.Where;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Where(clause = "active =1")
@Entity
@Table(name = "day")
@EntityListeners(AuditingEntityListener.class)

public class Day extends Bean implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@NotBlank
	@Column(name = "name")
	private String name;
	
	@Column(name = "created_at")
	@Temporal(TemporalType.TIMESTAMP)
	@LastModifiedDate
	private Date createdAt;
	

	@Column(name = "updated_at")
	@UpdateTimestamp
	private Date updatedAt;
	
	@Column(name = "created_by")
	private Integer createdBy;
	
	@Column(name = "updated_by")
	private Integer updatedBy;

	
	@Column(name = "active")
	private Integer active;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	

	

	
	
}