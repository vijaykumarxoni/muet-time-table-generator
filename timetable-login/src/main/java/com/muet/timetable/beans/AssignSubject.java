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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Where;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.stereotype.Component;


@Component
@Where(clause = "active =1")
@Entity
@Table(name = "assign_subject")
@EntityListeners(AuditingEntityListener.class)
public class AssignSubject extends Bean implements Serializable {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long   id;
	
	@NotNull
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "subject_id",referencedColumnName="id")
	private Subject subject;
	
	@NotNull
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "teacher_id",referencedColumnName="id")
	private Teacher teacher;
	

	@NotNull
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "section_id",referencedColumnName="id")
	private Section section;
	
	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	@NotNull
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "batch_id",referencedColumnName="id")
	private Batch batch;
	
	@NotNull
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "semester_id",referencedColumnName="id")
	private Semester semester;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Subject getSubject() {
		return subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Batch getBatch() {
		return batch;
	}

	public void setBatch(Batch batch) {
		this.batch = batch;
	}

	public Semester getSemester() {
		return semester;
	}

	public void setSemester(Semester semester) {
		this.semester = semester;
	}
	
	
	

}
