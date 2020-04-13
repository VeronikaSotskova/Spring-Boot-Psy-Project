<#import "parts/common.ftlh" as c />
<#import "parts/login_form.ftlh" as form />

<@c.page>
    <!-- Grid row -->
    <div class="row" style="margin-top: -100px;">

        <!-- Grid column -->
        <div class="col-md-12 px-lg-5">
            <!-- Card -->
            <div class="card pb-5 mx-md-3">
                <div class="card-body">
                    <div class="container">
                        <!-- Section heading -->
                        <h1 class="text-center h1 pt-4 mb-3">
                            <strong>Login</strong>
                        </h1>
                        <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                            <div class="alert alert-danger" role="alert">
                                ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
                                ${Session.SPRING_SECURITY_LAST_EXCEPTION}
                            </div>
                        </#if>
                        <div class="row mt-auto">
                            <div class="col-2"></div>
                            <div class="col-8"><@form.form /></div>
                            <div class="col-2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>