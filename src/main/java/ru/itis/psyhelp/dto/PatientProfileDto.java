package ru.itis.psyhelp.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PatientProfileDto extends ProfileDto {
    private String problem;

    public PatientProfileDto(String name, String surname, String patronymic, String email, Integer age, String problem) {
        super(name, surname, patronymic, email, age);
        this.problem = problem;
    }
}
