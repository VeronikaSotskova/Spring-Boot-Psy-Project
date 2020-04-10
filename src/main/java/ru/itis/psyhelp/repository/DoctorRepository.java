package ru.itis.psyhelp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ru.itis.psyhelp.models.Doctor;

import java.util.List;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Long> {
    Doctor findByEmail(String email);

    @Query("from Doctor as d " +
            "where UPPER(d.name) like concat(UPPER(:search),'%') " +
            "or " +
            "upper(d.surname) like concat(upper(:search),'%') " +
            "or " +
            "upper(d.patronymic) like concat(upper(:search),'%')")
    List<Doctor> findBySearch(@Param("search") String search);
}
