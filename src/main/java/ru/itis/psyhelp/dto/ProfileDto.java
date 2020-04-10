package ru.itis.psyhelp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import ru.itis.psyhelp.constraints.AccountAgeConstraint;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

@AllArgsConstructor
@Data
public class ProfileDto {

    @Size(min=2, max=50, message = "Name should be >2 and <50")
    private String name;

    @Size(min=2, message = "Surname too short")
    private String surname;

    @Size(min=2, message = "Patronymic too short")
    private String patronymic;

    @Email(message = "Email should be valid")
    private String email;

    @Digits(integer=3, fraction=0, message = "Не более 3-х знаков")
    @AccountAgeConstraint
    private Integer age;

}
