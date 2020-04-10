package ru.itis.psyhelp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.psyhelp.models.Doctor;
import ru.itis.psyhelp.repository.DoctorRepository;

import java.util.List;

@Service
public class DoctorService {

    @Autowired
    private DoctorRepository doctorRepository;

    public List<Doctor> filterDoctor(String filter) {
        if (filter != null && !filter.isEmpty()) {
            return doctorRepository.findBySearch(filter);
        } else {
            return doctorRepository.findAll();
        }
    }

}
