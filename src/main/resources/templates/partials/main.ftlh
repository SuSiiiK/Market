<#macro renderWith title="MI SHOP" dir="ltr">
<!doctype html>
<html lang="${.locale}" dir="${dir}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <title>${title}</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6e5baa, #4a00e0); /* Фиолетовый градиент */
            color: #333;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
        .navbar {
            background-color: #ffffff;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .navbar-brand img {
            max-height: 40px; /* Установите максимальную высоту для логотипа */
        }
        .nav-link, .navbar-brand {
            color: #333 !important;
            font-weight: 500;
        }
        .nav-item{
            margin-right: 10px;
        }
        .nav-link:hover {
            color: #4a00e0 !important;
        }
        .btn-warning {
            background-color: #ff9800;
            border-color: #ff9800;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-warning:hover {
            background-color: #e68900;
            border-color: #e68900;
        }
        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1000;
            top: 0;
            left: 0;
            background-color: #343a40;
            overflow-x: hidden;
            transition: 0.3s;
            padding-top: 60px;
            color: #ffffff;
        }
        .sidenav a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 22px;
            color: #e1e1e1;
            display: block;
            transition: 0.3s;
        }
        .sidenav a:hover {
            color: #ffffff;
        }
        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            color: #ffffff;
            margin-left: 50px;
        }
        .container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .form-inline {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        .form-select {
            max-width: 200px;
        }
        .pagination {
            margin: 30px 0;
        }
        .page-item.active .page-link {
            background-color: #4a00e0;
            border-color: #4a00e0;
            color: #ffffff;
        }
        .page-link {
            border-radius: 0;
            color: #4a00e0;
        }
        .page-link:hover {
            background-color: #f1f1f1;
        }
        footer {
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 -2px 6px rgba(0,0,0,0.1);
            text-align: center;
        }
        footer p {
            margin: 0;
            color: #666;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img src="https://seeklogo.com/images/M/mi-store-logo-51D3C04D50-seeklogo.com.png" alt="SHOP.KG">
            <span class="ms-2">SHOP.KG</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="openNav()">
                        <i class="fas fa-bars"></i> Меню
                    </a>
                </li>
            </ul>
            <form class="d-flex" id="form-id">
                <input class="form-control me-2" type="search" name="text" placeholder="<@spring.message 'search'/>" aria-label="Search">
                <select class="form-select me-2" name="param">
                    <option value="name"><@spring.message "search-name"/></option>
                    <option value="type"><@spring.message "search-Type"/></option>
                </select>
                <button class="btn btn-warning" type="submit" formaction="/found">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <ul class="navbar-nav ms-auto">
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" href="/basket">
                            <i class="fas fa-shopping-basket"></i> <@spring.message "Basket"/>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/profile">
                            <i class="fas fa-user"></i> ${(user.userName)!'-- missing --'}
                        </a>
                    </li>
                    <li class="nav-item">
                        <form action="/logout" method="post" class="d-inline">
                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <button class="btn btn-warning" type="submit">
                                <i class="fas fa-sign-out-alt"></i> LogOut
                            </button>
                        </form>
                    </li>
                <#else>
                    <li class="nav-item">
                        <a class="btn btn-warning" href="/user/login">
                            <i class="fas fa-sign-in-alt"></i> <@spring.message "LogIn"/>
                        </a>
                    </li>
                </#if>
            </ul>
        </div>
    </div>
</nav>

<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#"><i class="fas fa-home"></i> Главная</a>
    <a href="#"><i class="fas fa-info-circle"></i> О нас</a>
    <a href="#"><i class="fas fa-cogs"></i> Услуги</a>
    <a href="#"><i class="fas fa-envelope"></i> Контакты</a>

    <!-- Language Selector -->
    <div class="mt-4">
        <form action="" method="get" class="form-inline">
            <label for="lang_select" class="me-2 text-light">
                <@spring.message "label.language"/>:
            </label>
            <select name="lang" id="lang_select" class="form-select form-select-sm me-2">
                <option value="">Default</option>
                <option value="" disabled>----------</option>
                <option value="en-US" <#if .locale == "en-US">selected</#if>>American English</option>
                <option value="ru-RU" <#if .locale == "ru-RU">selected</#if>>Русский</option>
            </select>
            <button type="submit" class="btn btn-warning btn-sm">
                <i class="fas fa-language"></i> <@spring.message "button.language-change.text"/>
            </button>
        </form>
    </div>
</div>

<main class="container mt-4">
    <#nested>
    <div class="mt-4">
        <!-- Additional content can go here -->
    </div>
</main>

<footer>
    <p>&copy; 2024 SHOP.KG. Все права защищены.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
    }
</script>
</body>
</html>
</#macro>
