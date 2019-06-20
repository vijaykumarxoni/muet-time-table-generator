package com.muet.timetable.beans;

import java.io.Serializable;
import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Where;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;


@Where(clause = "active =1")
@Entity
@Table(name = "subject")
@EntityListeners(AuditingEntityListener.class)

public class Subject extends Bean implements Serializable {


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	@Column(name = "name")
	private String name;
	
	
	@Column(name = "type")
	private String type;
	
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "credit_hour")
	private String credit_hour;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "semester_id",referencedColumnName="id")
	private Semester semester;
	
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "dept_id",referencedColumnName="id")
	private Department dept;

	
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


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getCredit_hour() {
		return credit_hour;
	}


	public void setCredit_hour(String credit_hour) {
		this.credit_hour = credit_hour;
	}

	
	


	public Semester getSemester() {
		return semester;
	}


	public void setSemester(Semester semester) {
		this.semester = semester;
	}


	public Department getDept() {
		return dept;
	}


	public void setDept(Department dept) {
		this.dept = dept;
	}


	  

	
	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}



	
	

}
