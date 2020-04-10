package ru.itis.psyhelp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.psyhelp.dto.DoctorProfileDto;
import ru.itis.psyhelp.dto.PatientProfileDto;
import ru.itis.psyhelp.dto.ProfileDto;
import ru.itis.psyhelp.models.Account;
import ru.itis.psyhelp.models.Doctor;
import ru.itis.psyhelp.models.Patient;
import ru.itis.psyhelp.repository.AccountRepository;
import ru.itis.psyhelp.repository.DoctorRepository;
import ru.itis.psyhelp.repository.PatientRepository;
import sun.java2d.cmm.Profile;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private PatientRepository patientRepository;

    public List<Account> findAll() {
        return accountRepository.findAll();
    }

    public Doctor findDoctorByEmail(String email) {
        return doctorRepository.findByEmail(email);
    }

    public Patient findPatientByEmail(String email) {
        return patientRepository.findByEmail(email);
    }


    public void updatePatient(Patient patient, PatientProfileDto form) {
        if (isChanged(patient.getName(), form.getName())) {
            patient.setName(form.getName());
        }

        if (isChanged(patient.getSurname(), form.getSurname())) {
            patient.setSurname(form.getSurname());
        }

        if (isChanged(patient.getPatronymic(), form.getPatronymic())) {
            patient.setPatronymic(form.getPatronymic());
        }

        if (isChanged(patient.getEmail(), form.getEmail())) {
            patient.setEmail(form.getEmail());
        }

        if (isChanged(patient.getAge(), form.getAge())) {
            patient.setAge(form.getAge());
        }

        if (isChanged(patient.getProblem(), form.getProblem())) {
            patient.setProblem(form.getProblem());
        }
        patientRepository.save(patient);


    }

    public void updateDoctor(Doctor doctor, DoctorProfileDto form) {
        if (isChanged(doctor.getName(), form.getName())) {
            doctor.setName(form.getName());
        }

        if (isChanged(doctor.getSurname(), form.getSurname())) {
            doctor.setSurname(form.getSurname());
        }

        if (isChanged(doctor.getPatronymic(), form.getPatronymic())) {
            doctor.setPatronymic(form.getPatronymic());
        }

        if (isChanged(doctor.getAge(), form.getAge())) {
            doctor.setAge(form.getAge());
        }

        if (isChanged(doctor.getExperience(), form.getExperience())) {
            doctor.setExperience(form.getExperience());
        }

        if (isChanged(doctor.getAbout(), form.getAbout())) {
            doctor.setAbout(form.getAbout());
        }

        doctorRepository.save(doctor);
    }

    private boolean isChanged(Integer userField, Integer formField) {
        return (formField != null && !formField.equals(userField)) ||
                (userField != null && !userField.equals(formField));
    }

    private boolean isChanged(String userField, String formField) {
        return (formField != null && !formField.equals(userField)) ||
                (userField != null && !userField.equals(formField));
    }

    public void save(Account account) {
        accountRepository.save(account);
    }

    public boolean activateUser(String code) {
        Account user = accountRepository.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        user.setActive(true);
        accountRepository.save(user);

        return true;
    }
}
