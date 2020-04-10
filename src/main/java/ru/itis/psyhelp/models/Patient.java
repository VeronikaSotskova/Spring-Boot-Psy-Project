package ru.itis.psyhelp.models;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
@Table(name = "patient")
public class Patient extends Account {
    @Setter
    @Getter
    private String problem;

    @Override
    public Role getRole() {
        return Role.PATIENT;
    }

    @Override
    java.lang.String getType() {
        return "PATIENT";
    }
}
