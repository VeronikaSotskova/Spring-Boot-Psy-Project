<#macro edit_patient>
    <h1 class="text-primary"><span class="glyphicon glyphicon-user"></span>Edit Profile</h1>
    <hr>
    <div class="row">
        <!-- left column -->
        <div class="col-md-3">
            <div class="text-center">
                <img src="/img/${acc.avatarFilename!'avatar.jpg'}" class="avatar img-circle" alt="avatar"
                     style="width: 200px">
            </div>
        </div>

        <!-- edit form column -->
        <div class="col-md-9 personal-info">
            <!--ALERT<div class="alert alert-info alert-dismissable">
                <a class="panel-close close" data-dismiss="alert">×</a>
                <i class="fa fa-coffee"></i>
                This is an <strong>.alert</strong>. Use this to show important messages to the user.
            </div>-->
            <h3>Patient Personal info</h3>

            <form class="form-horizontal" role="form" action="/profile/patient" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <label class="col-lg-3 control-label">First name:</label>
                    <div class="col-lg-8">
                        <input name="name" class="form-control ${(nameError??)?string('is-invalid','')}" type="text"
                               value="${acc.name!''}">
                        <#if nameError??>
                            <div class="invalid-feedback">
                                ${nameError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Surname:</label>
                    <div class="col-lg-8">
                        <input name="surname" class="form-control ${(surnameError??)?string('is-invalid','')}" type="text"
                               value="${acc.surname!''}">
                        <#if surnameError??>
                            <div class="invalid-feedback">
                                ${surnameError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Patronymic:</label>
                    <div class="col-lg-8">
                        <input name="patronymic" class="form-control ${(patronymicError??)?string('is-invalid','')}"
                               type="text" value="${acc.patronymic!''}">
                        <#if patronymicError??>
                            <div class="invalid-feedback">
                                ${patronymicError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Email:</label>
                    <div class="col-lg-8">
                        <input readonly name="email" class="form-control disabled" type="email" value="${acc.email!''}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">Age:</label>
                    <div class="col-lg-8">
                        <input name="age" class="form-control ${(ageError??)?string('is-invalid','')}" type="number"
                               value="${acc.age!''}">
                        <#if ageError??>
                            <div class="invalid-feedback">
                                ${ageError}
                            </div>
                        </#if>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">Problem:</label>
                    <div class="col-lg-8">
                        <textarea name="problem" class="form-control">${acc.problem!''}</textarea>
                    </div>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="file">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>

                <button type="submit" class="btn btn-cyan">Edit</button>
            </form>
        </div>
    </div>
</#macro>