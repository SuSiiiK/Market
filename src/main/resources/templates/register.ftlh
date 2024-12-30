<#import "/spring.ftl" as spring>

<#import "partials/main.ftlh" as main />
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mi Shop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #f0f0f0;
            background-size: 400% 400%;
            animation: gradient 30s ease alternate-reverse;
            /*background-color: #f8f9fa;*/
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-page {
            width: 360px;
            /*padding: 8% 0 0;*/
        }
        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .form button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3s ease;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .form button:hover,.form button:active,.form button:focus {
            background: #666;

        }
        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }
        .form .message a {
            color: #ff5722;
            text-decoration: none;
        }
        .form .register-form {
            display: none;
        }
        .form .button-submit{
          background-color: #ff5722;
        }

    </style>
</head>
<body>

<div class="login-page">
    <div class="form">
        <form class="login-form" action="/user/register" method="post">
            <#if _csrf??>
                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
            </#if>
            <input type="text" name="name" placeholder="<@spring.message"Your-name"/>" value="${(form.name)!''}">
            <input type="text" name="email" placeholder="<@spring.message"Your-Email"/>" value="${(form.email)!''}">
            <input type="password" name="password" placeholder="<@spring.message"You-Password"/>" value="">
            <button class="button-submit"><@spring.message"create"/></button>
            <p class="message"><@spring.message"registed"/>? <a class="color-text" href="/user/login"><@spring.message"LogIn"/></a></p>
            <p class="message"><@spring.message"MainPage"/>? <a href="/"><@spring.message"MainPage"/></a></p>
        </form>
        <div style="padding-top: 15px">
            <form action="" method="get" class="my-3">
                <label for="lang_select">
                    <@spring.message "label.language" />:
                </label>
                <select name="lang" id="lang_select">
                    <option value="">Default</option>
                    <option value="" disabled>----------</option>
                    <option value="en-US">American English</option>
                    <option value="ru-RU">Русский</option>
                </select>
                <button class="button-submit" type="submit" class="btn btn-primary">
                    <@spring.message "button.language-change.text" />
                </button>
            </form>
        </div>
    </div>
</div>
</body>
</html>