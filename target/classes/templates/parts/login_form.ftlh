<#macro form>
    <!-- Default form login -->
    <form class="text-center border border-dark rounded mb-0 p-5 mt-5 z-depth-3" action="/signIn" method="post">

        <p class="h4 mb-4">Вход</p>

        <!-- Email -->
        <input name="email" type="email" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail">

        <!-- Password -->
        <input name="password" type="password" id="defaultLoginFormPassword" class="form-control mb-4"
               placeholder="Password">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <!-- Sign in button -->
        <button class="btn btn-info btn-block my-4" type="submit">Войти</button>

        <!-- Register -->
        <p>Нет аккаунта?
            <a href="/register">Зарегистрируйтесь</a>
        </p>

    </form>
    <!-- Default form login -->
</#macro>