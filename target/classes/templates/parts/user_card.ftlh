

<#macro user_card account>
    <#if account.experience == 1>
        <#assign
            strExp = "год"
        >
    <#elseif account.experience gt 1 && account.experience lt 5>
        <#assign
            strExp = "года"
        >
    <#else>
        <#assign
            strExp = "лет"
        >
    </#if>

    <#if account.gender == 'FEMALE'>
    </#if>
    <div class="card testimonial-card m-2 pt-2 grey lighten-3">


        <!-- Avatar -->
        <div class="avatar white mx-auto text-center grey lighten-3">
            <img src="/img/${account.avatarFilename!'avatar.jpg'}"
                 class="rounded-circle z-depth-1"
                 alt="avatar" width="150px" height="150px">
        </div>

        <!-- Content -->
        <div class="card-body grey lighten-3">
            <h5 class="card-title ">${account.name} ${account.surname}</h5>
            <hr>
            <!-- Quotation -->
            <p><i class="fas fa-quote-left grey lighten-3"></i> Пол: <#if account.gender == 'FEMALE'>женский<#else>мужской
                </#if>
            </p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item grey lighten-3">Age: ${account.age}</li>
            <li class="list-group-item grey lighten-3">Experience: ${account.experience} ${strExp}</li>
            <#if account.about??>
                <li class="list-group-item grey lighten-3">${account.about!''}</li>
            </#if>
        </ul>
        <div class="card-body grey lighten-3">
            <a href="#" class="card-link">Написать</a>
        </div>

    </div>
    <!-- Card -->
</#macro>