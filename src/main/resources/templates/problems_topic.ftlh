<#import "parts/common.ftlh" as c>
<#import "parts/message_card.ftlh" as card>

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
                            <strong>Topics</strong>
                        </h1>
                        <div class="row">
                            <#include "parts/problem_form.ftlh">
                        </div>

                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-10">
                                <div class="card-columns">
                                    <#list messages as msg>
                                        <@card.msg_card msg acc></@card.msg_card>
                                    </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>