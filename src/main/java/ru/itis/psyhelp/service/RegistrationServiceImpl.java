package ru.itis.psyhelp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import ru.itis.psyhelp.dto.DoctorDto;
import ru.itis.psyhelp.dto.PatientDto;
import ru.itis.psyhelp.models.Account;
import ru.itis.psyhelp.models.Doctor;
import ru.itis.psyhelp.models.Gender;
import ru.itis.psyhelp.models.Patient;
import ru.itis.psyhelp.repository.AccountRepository;
import ru.itis.psyhelp.repository.DoctorRepository;
import ru.itis.psyhelp.repository.PatientRepository;

import java.util.UUID;

@Service
public class RegistrationServiceImpl implements RegistrationService{

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private DoctorRepository doctorRepository;

    @Autowired
    private PatientRepository patientRepository;

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private MailSender mailSender;


    @Override
    public boolean register(DoctorDto form, Gender gender) {
        Account accFromDb = accountRepository.findByEmail(form.getEmail());

        if (accFromDb != null) {
            return false;
        }

        Doctor doctor = new Doctor();
        doctor.setName(form.getName());
        doctor.setSurname(form.getSurname());
        doctor.setExperience(form.getExperience());
        doctor.setAge(form.getAge());
        doctor.setEmail(form.getEmail());
        doctor.setPassword(passwordEncoder.encode(form.getPassword()));
        doctor.setGender(gender);
        doctor.setActive(false);
        doctor.setActivationCode(UUID.randomUUID().toString());
        doctorRepository.save(doctor);

        sendMessage(doctor);
        return true;
    }

    @Override
    public boolean register(PatientDto form, Gender gender) {
        Account accFromDb = accountRepository.findByEmail(form.getEmail());

        if (accFromDb != null) {
            return false;
        }

        Patient patient = new Patient();
        patient.setName(form.getName());
        patient.setSurname(form.getSurname());
        patient.setAge(form.getAge());
        patient.setEmail(form.getEmail());
        patient.setPassword(passwordEncoder.encode(form.getPassword()));
        patient.setGender(gender);
        patient.setActive(false);
        patient.setActivationCode(UUID.randomUUID().toString());
        patientRepository.save(patient);

        sendMessage(patient);
        return true;
    }

    private void sendMessage(Account user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s \n" +
                            "Welcome to site. Please visit next link: http://localhost/activate/%s",
                    user.getName(),
                    user.getActivationCode()
            );
            mailSender.send(user.getEmail(), "Activation code", message);
        }
    }
}
