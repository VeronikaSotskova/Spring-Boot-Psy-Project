<#import "parts/common.ftlh" as c>
<#import "parts/user_card.ftlh" as card>

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
                            <strong>Doctors</strong>
                        </h1>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <form method="get" action="/doctor-list" class="form-inline">
                                    <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                                           placeholder="Search"/>
                                    <button type="submit" class="btn btn-primary ml-2">Search</button>
                                </form>
                            </div>
                        </div>
                        <div class="col m-4">
                            <div class="card-columns">
                                <#list doctors as doctor>
                                    <@card.user_card doctor />
                                </#list>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>