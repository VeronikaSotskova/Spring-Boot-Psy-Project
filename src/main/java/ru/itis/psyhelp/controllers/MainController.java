package ru.itis.psyhelp.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.psyhelp.models.Doctor;
import ru.itis.psyhelp.service.AccountService;
import ru.itis.psyhelp.service.DoctorService;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private DoctorService doctorService;

    @GetMapping("/")
    public String secret(Model model) {
        model.addAttribute("nav_tab", "home");
        return "home";
    }

    @GetMapping("/doctor-list")
    public String accList(Model model, @RequestParam(required = false) String filter) {
        List<Doctor> doctors = doctorService.filterDoctor(filter);
        model.addAttribute("doctors", doctors);
        model.addAttribute("nav_tab", "doctor_list");
        return "doctor_list";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code) {
        boolean isActivated = accountService.activateUser(code);

        if (isActivated) {
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "User successfully activated.");

        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Activation code is not found.");
        }

        return "login";
    }


}
