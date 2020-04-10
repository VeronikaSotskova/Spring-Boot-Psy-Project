package ru.itis.psyhelp.dto;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import ru.itis.psyhelp.constraints.AccountAgeConstraint;
import ru.itis.psyhelp.models.Gender;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
public class AccountDto {

    @NotBlank(message = "Please fill the name")
    @Size(min=2, max=50, message = "Name should be >2 and <50")
    protected String name;

    @NotBlank(message = "Please fill the surname")
    @Size(min=2, message = "Surname too short")
    protected String surname;

    @Digits(integer=3, fraction=0, message = "Не более 3-х знаков")
    @AccountAgeConstraint
    protected Integer age;

    @NotBlank(message = "Email cannot be empty")
    @Email(message = "Email should be valid")
    protected String email;


    @NotBlank(message = "Password cannot be empty")
    @Length(min = 6, message = "Too short, must be > 6")
    protected String password;

    @NotBlank(message = "Password confirmation cannot be empty")
    protected String password2;




}
