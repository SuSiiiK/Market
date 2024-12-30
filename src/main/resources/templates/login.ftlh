<#import "/spring.ftl" as spring>

<#import "partials/main.ftlh" as main />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0; /* Светлый фон */
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-container {
            width: 400px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            font-weight: 700;
            margin-bottom: 20px;
            color: #333;
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
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            height: 40px; /* Увеличиваем высоту поля */
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #ff5722; /* Цвет акцента Xiaomi */
            outline: none;
        }

        .login-btn {
            background-color: #ff5722; /* Цвет акцента Xiaomi */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background-color: #e64a19; /* Темнее при наведении */
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .message {
            font-size: 14px;
            color: #666;
        }

        .message a {
            color: #ff5722; /* Цвет акцента Xiaomi */
            text-decoration: none;
        }

        .message a:hover {
            text-decoration: underline;
        }

        .language-selector {
            margin-top: 20px;
        }

        .language-selector label {
            margin-right: 10px;
        }

        .language-selector select {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-right: 5px;
        }

        .language-selector button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            background-color: #ff5722; /* Цвет акцента Xiaomi */
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .language-selector button:hover {
            background-color: #e64a19; /* Темнее при наведении */
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
            <button type="submit" class="login-btn">Log In</button>
    </form>
    <div class="form-footer">
        <p class="message">
            <@spring.message "NotRegist"/>?
            <a href="/user/register"><@spring.message "CreateAccount"/></a>
        </p>
        <p class="message">
            <@spring.message "ForgotPass"/>?
            <a href="/forgotpass"><@spring.message "ResetPassword"/></a>
        </p>
        <p class="message">
            <@spring.message "MainPage"/>?
            <a href="/"><@spring.message "Main"/></a>
        </p>
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
<script>
    // Обработка изменения языка
    const langSelect = document.getElementById('lang_select');
    langSelect.addEventListener('change', () => {
        const selectedLang = langSelect.value;
        window.location.search = `?lang=${selectedLang}`;
    });
</script>
</body>
</html>