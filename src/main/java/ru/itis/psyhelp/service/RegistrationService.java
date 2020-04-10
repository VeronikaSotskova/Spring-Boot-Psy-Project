package ru.itis.psyhelp.service;

import ru.itis.psyhelp.dto.DoctorDto;
import ru.itis.psyhelp.dto.PatientDto;
import ru.itis.psyhelp.models.Gender;

public interface RegistrationService {
    boolean register(DoctorDto form, Gender gender);
    boolean register(PatientDto form, Gender gender);
}
