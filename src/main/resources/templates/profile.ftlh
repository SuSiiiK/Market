
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(to right, #ff6b6b, #ffa500, #ffff00, #00ff00, #00ffff, #0000ff, #ff00ff);
        background-size: 400% 400%;
        animation: gradient 30s ease alternate-reverse;
    }

    @keyframes gradient {
        0% {
            background-position: 0% 50%;
        }
        50% {
            background-position: 100% 50%;
        }
        100% {
            background-position: 0% 50%;
        }
    }

    .user-info-container {
        background-color: rgba(255, 255, 255, 0.8);
        color: #333;
        padding: 20px;
        border-radius: 20px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        text-align: center;
        margin-top: 50px;
    }

    .user-info-details {
        margin-top: 20px;
    }

    .bottom-box {
        text-align: center;
        margin-top: 30px;
    }

    .home-link {
        text-decoration: none;
    }

    .logout-form-container {
        text-align: center;
        margin-top: 30px;
    }

    .logout-button {
        margin-top: 10px;
    }
</style>

<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400,500,600&display=swap" rel="stylesheet">

<#if user??>

    <div class="user-info-container">
        <h1>Ваши учетные данные</h1>
        <div class="user-info-details">
            <p>Имя: ${(user.userName)!'-- missing --'}</p>
            <p>Email: ${(user.email)!'-- email missing --'}</p>
        </div>
    </div>
<#else>
    <div class="no-user-found">
        <h1>Пользователь не найден!</h1>
    </div>
</#if>

<div class="bottom-box">
    <a href="/" class="home-link">На главную страницу</a>
</div>

<div class="logout-form-container">
    <form action="/logout" method="post" class="logout-form">
        <#if _csrf??>
            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
        </#if>
        <button type="submit" class="logout-button">Выйти</button>
    </form>
</div>