<#include "security.ftlh">
<#import "logout_part.ftlh" as logout>

<nav class="navbar navbar-expand-lg navbar-dark elegant-color mb-2">
    <a class="navbar-brand" href="/">Psy</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">

            <li class="nav-item <#if nav_tab??><#if nav_tab=="home">active</#if></#if>">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item <#if nav_tab??><#if nav_tab=="doctor_list">active</#if></#if>">
                <a class="nav-link" href="/doctor-list">Doctor List</a>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto nav-flex-icons">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <#if known>
                        <i class="fas fa-user"></i>
                        ${name}
                    <#else>
                        Sign in or Sign Up
                    </#if>
                </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                    <#if known>
                        <a class="dropdown-item" href="/profile">My account</a>
                        <form action="/logout" method="post" class="form-inline">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="dropdown-item" style="font-size: .9375rem;
                             font-weight: 300; padding: 10px;">
                                Sign out
                            </button>
                        </form>
                    <#else>
                        <a class="dropdown-item" href="/register">Sign up</a>
                        <a class="dropdown-item" href="/signIn">Sign in</a>
                    </#if>
                </div>
            </li>
        </ul>
    </div>
</nav>