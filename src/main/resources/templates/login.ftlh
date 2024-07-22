
<#import "/spring.ftl" as spring>

<#import "partials/main.ftlh" as main />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
<#--    <link rel="stylesheet" href="login.css">-->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #ff6b6b, #ffa500, #ffff00, #00ff00, #00ffff, #0000ff, #ff00ff);
            background-size: 400% 400%;
            animation: gradient 30s ease alternate-reverse;
        }


        .login-container {
            width: 400px;
            margin: 115px auto;
            background-color: white;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .login-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .login-btn {
            background-color: darkorange;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .login-btn:hover {
            color: #666;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .message {
            font-size: 14px;
            color: #666;
            /*color: orangered;*/
        }

        .message a {
            color: orangered;
            text-decoration: none;
        }

        .message a:hover {
            text-decoration: underline;
        }

        .language-selector {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Log In</h2>
    <form class="login-form" action="/user/login" method="post">
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
        </#if>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Your-Email" value="${(form.email)!''}">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Your-Password">
        </div>
        <button  type="submit" class="login-btn">Log In</button>
    </form>
    <div class="form-footer">
        <p class="message"><@spring.message"NotRegist"/>? <a href="/user/register"><@spring.message"CreateAccount"/></a></p>
        <p class="message"><@spring.message"ForgotPass"/>? <a href="/forgotpass"><@spring.message"ResetPassword"/></a></p>
        <p class="message"><@spring.message"MainPage"/>? <a href="/"><@spring.message"Main"/></a></p>
    </div>
    <div class="language-selector">
        <form action="" method="get" class="my-3">
            <label for="lang_select"><@spring.message "label.language" />:</label>
            <select name="lang" id="lang_select">
                <option value="">Default</option>
                <option value="" disabled>----------</option>
                <option value="en-US">American English</option>
                <option value="ru-RU">Русский</option>
            </select>
            <button type="submit"><@spring.message "button.language-change.text" /></button>
        </form>
    </div>
</div>
<script >// Обработка изменения языка
    const langSelect = document.getElementById('lang_select');
    langSelect.addEventListener('change', () => {
        const selectedLang = langSelect.value;
        window.location.search = `?lang=${selectedLang}`;
    });</script>
</body>
</html>
