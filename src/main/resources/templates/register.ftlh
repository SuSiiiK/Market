<#import "partials/main.ftlh" as main />

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mi Shop</title>
</head>
<body>

<div class="login-page">
    <div class="form">
        <form class="login-form" action="/user/register" method="post">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="text" name="name" placeholder="Your-name" value="${(form.name)!''}">
            <input type="text" name="email" placeholder="Your-Email" value="${(form.email)!''}">
            <input type="text" name="password" placeholder="You-Password" value="">
            <button>create</button>
            <p class="message">registed <a href="/user/login">LogIn</a></p>
            <p class="message">MainPage  <a href="/">MainPage</a></p>
        </form>

    </div>
</div>
</body>
</html>