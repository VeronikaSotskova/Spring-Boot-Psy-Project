<#macro reg_form genders>
    <form action="/register/patient" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <label for="name" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
                <input name="name" class="form-control ${(nameError??)?string('is-invalid','')}" id="name"
                       value="<#if user??>${user.name!''}</#if>">
                <#if nameError??>
                    <div class="invalid-feedback">
                        ${nameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <label for="surname" class="col-sm-2 col-form-label">Surname</label>
            <div class="col-sm-10">
                <input name="surname" class="form-control ${(surnameError??)?string('is-invalid','')}" id="surname"
                       value="<#if user??>${user.surname!''}</#if>">
                <#if surnameError??>
                    <div class=" invalid-feedback">
                        ${surnameError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <label for="age" class="col-sm-2 col-form-label">Age</label>
            <div class="col-sm-10">
                <input type="number" min="1" step="1" name="age"
                       class="form-control ${(ageError??)?string('is-invalid','')}"
                       id="age"
                       value="<#if user??>${user.age!''}</#if>">
                <#if ageError??>
                    <div class=" invalid-feedback">
                        ${ageError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input name="email" type="email" class="form-control" id="inputEmail3"
                       class="form-control ${(emailError??)?string('is-invalid','')}"
                       value="<#if user??>${user.email!''}</#if>">
                <#if emailError??>
                    <div class=" invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
                <input name="password" type="password"
                       class="form-control ${(passwordError??)?string('is-invalid','')}"
                       value="<#if user??>${user.password!''}</#if>" id="inputPassword3">
                <#if passwordError??>
                    <div class=" invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>

        <div class="form-group row">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Password Confirm</label>
            <div class="col-sm-10">
                <input name="password2" type="password"
                       class="form-control ${(password2Error??)?string('is-invalid','')}"
                       id="inputPassword3">
                <#if password2Error??>
                    <div class=" invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
        </div>

        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">Gender</legend>
                <div class="col-sm-10">
                    <#list genders as gender>
                        <div class="form-check">
                            <input type="radio" name="gender" id="${gender}"
                                   class="form-check-input" value="${gender}">
                            <label class="form-check-label" for="${gender}">
                                ${gender}
                            </label>
                        </div>
                    </#list>
                    <#if genderError??>
                        <div class=" invalid-feedback">
                            ${genderError}
                        </div>
                    </#if>
                </div>
            </div>
        </fieldset>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </div>
    </form>
</#macro>