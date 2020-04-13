<#import "parts/edit_doctor.ftlh" as doc_form>
<#import "parts/edit_patient.ftlh" as pat_form>
<#import "parts/common.ftlh" as c>

<@c.page>
    <!-- Grid row -->
    <div class="row" style="margin-top: -100px;">
        <!-- Grid column -->
        <div class="col-md-12 px-lg-5">
            <!-- Card -->
            <div class="card pb-5 mx-md-3">
                <div class="card-body">
                    <div class="container">
                        <h1 class="text-center h1 pt-4 mb-3">
                            <strong>My profile</strong>
                        </h1>
                        <#if type=="doctor">
                            <@doc_form.edit_doctor />
                        <#elseif type=="patient">
                            <@pat_form.edit_patient />
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>