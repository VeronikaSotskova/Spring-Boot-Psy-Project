package ru.itis.psyhelp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import ru.itis.psyhelp.dto.DoctorDto;
import ru.itis.psyhelp.dto.PatientDto;
import ru.itis.psyhelp.models.Gender;
import ru.itis.psyhelp.service.RegistrationService;

import javax.validation.Valid;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import static ru.itis.psyhelp.controllers.ControllerUtils.getErrors;

@Controller
@RequestMapping("/register")
public class RegistrationController {
    @Autowired
    private RegistrationService registrationService;

    @GetMapping
    public String viewRegister(Model model) {
        model.addAttribute("genders", Gender.values());
        model.addAttribute("nav_tab", "reg");
        return "reg_page";
    }

    @PostMapping("/doctor")
    public String register(
            @RequestParam(name = "gender", required = false) Gender gender,
            @Valid @ModelAttribute DoctorDto form,
            BindingResult bindingResult,
            Model model
    ) {

        boolean isPasswordDifferent = !form.getPassword().equals(form.getPassword2());
        boolean isConfirmEmpty = StringUtils.isEmpty(form.getPassword2());
        boolean isGenderEmpty = gender == null;
        boolean isRegister = registrationService.register(form, gender);

        if (isGenderEmpty) {
            model.addAttribute("genderError", "You should choose your gender");
        }

        if (isConfirmEmpty) {
            model.addAttribute("password2Error", "Password confirmation cannot be empty");
        }

        if (form.getPassword() != null && isPasswordDifferent) {
            model.addAttribute("passwordError", "Password are different!");
        }
        if(!isRegister) {
            model.addAttribute("emailError", "User exists!");
        }

        if (isPasswordDifferent || isConfirmEmpty || bindingResult.hasErrors() || isGenderEmpty || !isRegister) {
            Map<String, String> errors = getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("user", form);
            model.addAttribute("genders", Gender.values());
            model.addAttribute("nav_tab", "reg");
            model.addAttribute("type", "doctor");
            return "reg_page";
        }

        return "redirect:/signIn";
    }



    @PostMapping("/patient")
    public String register(
            @RequestParam(name = "gender", required = false) Gender gender,
            @Valid PatientDto form,
            BindingResult bindingResult,
            Model model
    ) {
        boolean isPasswordDifferent = !form.getPassword().equals(form.getPassword2());
        boolean isConfirmEmpty = StringUtils.isEmpty(form.getPassword2());
        boolean isGenderEmpty = gender == null;
        boolean isRegister = registrationService.register(form, gender);

        if (isGenderEmpty) {
            model.addAttribute("genderError", "You should choose your gender");
        }

        if (isConfirmEmpty) {
            model.addAttribute("password2Error", "Password confirmation cannot be empty");
        }

        if (form.getPassword() != null && isPasswordDifferent) {
            model.addAttribute("passwordError", "Password are different!");
        }

        if(!isRegister) {
            model.addAttribute("emailError", "User exists!");
        }

        if (isPasswordDifferent || isConfirmEmpty || bindingResult.hasErrors() || isGenderEmpty || !isRegister) {
            Map<String, String> errors = getErrors(bindingResult);

            model.mergeAttributes(errors);
            model.addAttribute("user", form);
            model.addAttribute("genders", Gender.values());
            model.addAttribute("nav_tab", "reg");
            model.addAttribute("type", "patient");
            return "reg_page";
        }

        return "redirect:/signIn";
    }

}
