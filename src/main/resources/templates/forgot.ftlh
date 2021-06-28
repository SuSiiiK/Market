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
        <form class="login-form" action="/forgot" method="post">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="text" name="email" placeholder="Your-Email"  value="${(form.email)!''}">
            <button>Change</button>
            <p class="message">registed<a href="/forgotpass">LogIn </a></p>
            <p class="message">MainPage<a href="/">MainPage </a></p>
        </form>
           </div>
</div>
</body>
</html>