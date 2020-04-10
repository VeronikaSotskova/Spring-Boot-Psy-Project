<#import "parts/common.ftlh" as c>
<#import "parts/user_card.ftlh" as card>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/doctor-list" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search" />
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
</@c.page>