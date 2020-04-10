package ru.itis.psyhelp.constraints;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = AccountAgeConstraintValidator.class)
public @interface AccountAgeConstraint {
    String message() default "Отрицательное значение";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
