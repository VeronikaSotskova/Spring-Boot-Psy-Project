<#import "parts/common.ftlh" as c>
<#import "parts/doctor_register_form.ftlh" as doctor_form>
<#import "parts/patient_register_form.ftlh" as patient_form>

<@c.page>
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8 rounded mt-5 z-depth-3 text-center py-3">
            <p class="h4 mb-2">Регистрация</p>
            <#if emailError??>
                ${emailError}
            </#if>
            <#if genderError??>
                ${genderError}
            </#if>

            <ul class="nav nav-tabs mb-2" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link <#if type??><#if type=='patient'>active</#if><#else>active</#if>" id="home-tab" data-toggle="tab" href="#home" role="tab"
                       aria-controls="home"
                       aria-selected="<#if type??><#if type=='patient'>true<#else>false</#if><#else>true</#if>">Patient</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <#if type??><#if type=='doctor'>active</#if><#else></#if>" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                       aria-controls="profile"
                       aria-selected="<#if type??><#if type=='doctor'>true<#else>false</#if>false<#else>false</#if>">Doctor</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">

                <div class="tab-pane fade <#if type??><#if type=='patient'> show active</#if><#else>show active</#if>" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <@patient_form.reg_form genders />
                </div>
                <div class="tab-pane fade <#if type??><#if type=='doctor'> show active</#if><#else></#if>" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <@doctor_form.reg_form genders />
                </div>

            </div>
        </div>
        <div class="col-2"></div>
    </div>

</@c.page>