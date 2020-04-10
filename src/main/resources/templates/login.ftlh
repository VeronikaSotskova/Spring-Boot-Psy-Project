<#import "parts/common.ftlh" as c />
<#import "parts/login_form.ftlh" as form />

<@c.page>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
            ${Session.SPRING_SECURITY_LAST_EXCEPTION}
        </div>
    </#if>
        <div class="row mt-auto">
            <div class="col-4"></div>
            <div class="col-4"><@form.form /></div>
            <div class="col-4"></div>
        </div>


</@c.page>