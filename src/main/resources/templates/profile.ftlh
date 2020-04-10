<#import "parts/edit_doctor.ftlh" as doc_form>
<#import "parts/edit_patient.ftlh" as pat_form>
<#import "parts/common.ftlh" as c>

<@c.page>
    <#if type=="doctor">
        <@doc_form.edit_doctor />
    <#elseif type=="patient">
        <@pat_form.edit_patient />
    </#if>
</@c.page>