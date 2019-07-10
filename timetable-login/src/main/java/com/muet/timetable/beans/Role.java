package com.muet.timetable.beans;

import javax.persistence.*;

import org.hibernate.annotations.Where;

import java.io.Serializable;
import java.util.Set;

@Where(clause = "active =1")
@Entity
@Table(name = "role")
public class Role  extends Bean implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;

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

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
