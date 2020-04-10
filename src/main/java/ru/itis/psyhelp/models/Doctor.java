package ru.itis.psyhelp.models;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.Table;


@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "doctor")
public class Doctor extends Account {


    private Integer experience;

    private String about;

    private Double score;

    @Override
    public Role getRole() {
        return Role.DOCTOR;
    }

    @Override
    String getType() {
        return "DOCTOR";
    }
}

