<#import "/spring.ftl" as spring>


<!doctype html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"

          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <style>

        body {

            font-family: 'Roboto', sans-serif;

            background: #f0f0f0;

            display: flex;

            justify-content: center;

            align-items: center;

            height: 75vh;

            margin: 0;

        }

        .login-page {

            width: 400px; /* Увеличено для большего пространства */

        }

        .form {

            position: relative;

            z-index: 1;

            background: #FFFFFF;

            max-width: 400px; /* Увеличено для соответствия ширине */

            margin: 0 auto 100px;

            padding: 60px; /* Увеличено для большего пространства */

            text-align: center;

            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);

        }

        .form input {

            font-family: "Roboto", sans-serif;

            outline: 0;

            background: #f2f2f2;

            width: 100%;

            border: 1px solid #ccc; /* Добавлено для лучшей видимости */

            margin: 0 0 20px; /* Увеличено для большего пространства между полями */

            padding: 20px; /* Увеличено для большего пространства внутри поля */

            box-sizing: border-box;

            font-size: 16px; /* Увеличено для лучшей читаемости */

        }

        .form button {

            font-family: "Roboto", sans-serif;

            text-transform: uppercase;

            outline: 0;

            background: #ff5722;

            margin-top: 10px; /* Увеличено для большего пространства */

            width: 100%;

            border: 0;

            padding: 20px; /* Увеличено для большего пространства внутри кнопки */

            color: #FFFFFF;

            font-size: 16px; /* Увеличено для лучшей читаемости */

            transition: all 0.3s ease;

            cursor: pointer;

        }

        .form button:hover, .form button:active, .form button:focus {

            background: #e64a19; /* Темнее цвет для эффекта наведения */

        }

        .form .message {

            margin: 20px 0 0; /* Увеличено для большего пространства */

            color: #b3b3b3;

            font-size: 14px; /* Увеличено для лучшей читаемости */

        }

        .form .message a {

            color: #ff5722;

            text-decoration: none;

        }

    </style>

    <title>Mi Shop</title>

</head>

<body>


<div class="login-page">

    <div class="form">

        <form class="login-form" action="/forgot" method="post">

            <#if _csrf??>

                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>

            </#if>

            <label>

                <input type="text" name="email" placeholder="<@spring.message 'Your-Email'/>" value="${(form.email)!''}">

            </label>

            <button type="submit"><@spring.message 'button.language-change.text'/></button>

            <p class="message"><@spring.message 'registed'/> ? <a href="/forgotpass"><@spring.message 'LogIn'/></a></p>

            <p class="message"><@spring.message 'MainPage'/> ? <a href="/"><@spring.message 'MainPage'/></a></p>

        </form>


        <div style="padding-top: 20px"> <!-- Увеличено для большего пространства -->

            <form action="" method="get" class="my-3">

                <label for="lang_select">

                    <@spring.message "label.language" />:

                </label>

                <select name="lang" id="lang_select" style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; font-size: 16px;"> <!-- Увеличено для лучшего восприятия -->

                    <option value="">Default</option>

                    <option value="" disabled>----------</option>

                    <option value="en-US">American English</option>

                    <option value="ru-RU">Русский</option>

                </select>

                <button type="submit" style="padding: 10px 15px; border-radius: 5px; background-color: #ff5722; color: white; font-size: 16px; cursor: pointer;">

                    <@spring.message "button.language-change.text" />

                </button>

            </form>

        </div>

    </div>

</div>

</body>

</html>