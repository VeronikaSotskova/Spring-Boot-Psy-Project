package ru.itis.psyhelp.constraints;


import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class AccountAgeConstraintValidator implements ConstraintValidator<AccountAgeConstraint, Integer> {

    @Override
    public boolean isValid(Integer age, ConstraintValidatorContext constraintValidatorContext) {
        if (age == null) {
            return false;
        } else {
            return age > 0;
        }
    }
}