package ru.itis.psyhelp.models;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.UniqueElements;
import ru.itis.psyhelp.constraints.AccountAgeConstraint;

import javax.persistence.*;
import javax.validation.constraints.*;

@Data
@Entity
@Table(name = "account")
public abstract class Account  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    protected String name;


    protected String surname;

    protected String patronymic;

    protected String password;

    protected Integer age;

    protected boolean isActive;
    protected String activationCode;

    @Enumerated(EnumType.STRING)
    protected Gender gender;

    @Column(unique=true)
    protected String email;

    protected String avatarFilename;

    @Enumerated(EnumType.STRING)
    protected Role role;


    abstract String getType();
}
