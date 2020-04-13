<#include "security.ftlh">
<#macro msg_card msg acc>
    <!-- Card -->
    <div class="card card-cascade wider">
        <#if msg.id%4==0>
            <#assign color = 'peach'>
        <#elseif msg.id%3==0>
            <#assign color = 'blue'>
        <#elseif msg.id%2==0>
            <#assign color = 'purple'>
        <#else>
            <#assign color = 'aqua'>
        </#if>
        <!-- Card image -->
        <div class="view view-cascade gradient-card-header ${color}-gradient">
            <#if known>
                <#if msg.author.id == acc.id>
                    <a href="/problems/${msg.id}/delete" class="close" aria-label="Close"><i class="fas fa-times"></i></a>
                </#if>
            </#if>
            <!-- Title -->
            <h2 class="card-header-title mb-3">${msg.title}</h2>
            <!-- Text -->
            <p class="mb-0"><i class="fas fa-calendar mr-2"></i>${msg.publishedAt.year}-${msg.publishedAt.month.value}
                -${msg.publishedAt.dayOfMonth}</p>
            <p class="mb-0"><i class="fas fa-user mr-2"></i>${msg.author.surname} ${msg.author.name}</p>
        </div>
        <!-- Card content -->
        <div class="card-body card-body-cascade text-center">
            <!-- Text -->
            <p class="card-text">${msg.content}</p>
            <!-- Link -->
            <a href="/problems/${msg.id}" class="orange-text d-flex flex-row-reverse p-2">
                <h5 class="waves-effect waves-light">Ответить<i class="fas fa-angle-double-right ml-2"></i>
                </h5>
            </a>
        </div>
        <!-- Card content -->
    </div>
    <!-- Card -->
</#macro>