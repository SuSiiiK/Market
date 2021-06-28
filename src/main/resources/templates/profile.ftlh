<#if user??>
    <h1>Ваши учетные данные!</h1>
    <p>${(user.userName)!'-- missing --'} - ${(user.email)!'-- email missing --'}</p>
<#else>
    <h1>Пользователь не найден!</h1>
</#if>
<div class="bottom-box">
    <a href="/">На главную страницу</a>
</div>

<form action="/logout" method="post">

    <#if _csrf??>
        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
    </#if>
    <button type="submit">LogOut</button>
</form>