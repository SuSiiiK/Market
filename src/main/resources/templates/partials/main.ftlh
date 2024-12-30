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
                background: #f5f5f5;
                color: #333;
                margin: 0;
                padding: 0;
                overflow-x: hidden;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .navbar {
                background-color: #ffffff;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .navbar-brand img {
                max-height: 40px;
            }

            .nav-link, .navbar-brand {
                color: #333;
                font-weight: 500;
            }

            .nav-item {
                margin-right: 6px;
            }

            .nav-link:hover {
                color: #4a00e0 !important;
            }

            .btn-warning {
                background-color: #e65100;
                border-color: #e65100;
                transition: background-color 0.3s, border-color 0.3s;
            }

            .btn-warning:hover {
                background-color: #e65100;
                border-color: #e65100;
            }

            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1050;
                top: 0;
                left: 0;
                background-color: #ffffff;
                overflow-x: hidden;
                transition: 0.3s;
                padding-top: 60px;
                color: #333;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .sidenav .sidenav-header {
                padding: 13px 20px;
                font-size: 20px;
                color: #4a00e0;
                border-bottom: 1px solid #ddd;
            }

            .sidenav a {
                padding: 15px 20px;
                text-decoration: none;
                font-size: 18px;
                color: #333;
                display: block;
                transition: 0.3s;
            }

            .sidenav a:hover {
                background-color: #f1f1f1;
                color: #4a00e0;
            }

            .sidenav .sidenav-footer {
                position: absolute;
                bottom: 0;
                width: 100%;
                padding: 15px;
                border-top: 1px solid #ddd;
                background-color: #f9f9f9;
            }

            .custom-container {
                flex: 1;
            }

            .container {
                padding: 30px;
                max-width: 1360px;
                margin: auto;
            }

            footer {
                background-color: #343a40;
                color: #ffffff;
                padding: 20px 0;
                text-align: center;
                margin-top: 20px;
            }

            footer .contact-info {
                font-size: 0.875rem;
            }

            footer .contact-info p {
                margin: 5px 0;
            }

            footer .contact-info i {
                margin-right: 10px;
            }

            .navbar.fixed-top {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                z-index: 1030;
            }

            .btn-login {
                background-color: transparent;
                border: none;
                color: #333;
                font-size: 1.5rem;
                display: flex;
                align-items: center;
                transition: color 0.3s;
            }

            .btn-login:hover {
                color: orangeRed;
            }

            .btn-login i {
                font-size: 21px;
                margin-right: 1px;
            }

            .btn-login span {
                font-size: 1rem;
            }

            .search-form {
                display: flex;
                align-items: center;
                margin-right: 20px;
            }

            .search-form input {
                border-radius: 20px;
                border: 1px solid #ddd;
                padding: 12px 21px;
                width: 358px;
            }

            .search-form button {
                border-radius: 20px;
                margin-left: -54px;
                font-size: 23px;
            }

            .navbar-nav {
                margin-top: 10px; /* Adjust spacing as needed */
            }

            .nav-link {
                font-size: 1.2rem; /* Increase font size for better visibility */
            }

            .cart-sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1050;
                top:  0;
                right: 0;
                background-color: #ffffff;
                overflow-x: hidden;
                transition: 0.3s;
                padding-top: 60px;
                color: #333;
                box-shadow: -4px 0 6px rgba(0, 0, 0, 0.1);
            }

            .cart-sidenav .cart-header {
                padding: 13px 20px;
                font-size: 20px;
                color: #4a00e0;
                border-bottom: 1px solid #ddd;
            }

            .cart-sidenav a {
                padding: 15px 20px;
                text-decoration: none;
                font-size: 18px;
                color: #333;
                display: block;
                transition: 0.3s;
            }

            .cart-sidenav a:hover {
                background-color: #f1f1f1;
                color: #4a00e0;
            }

            /* Media Queries for Mobile Responsiveness */
            @media (max-width: 768px) {
                .navbar {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .search-form {
                    width: 100%;
                    margin: 10px 0;
                }

                .search-form input {
                    width: calc(100% - 50px); /* Adjust width for mobile */
                }

                .nav-item {
                    margin-right: 0;
                    margin-bottom: 10px; /* Add spacing between nav items */
                }

                .nav-link {
                    font-size: 1rem; /* Decrease font size for mobile */
                }

                .btn-warning {
                    width: 100%; /* Make buttons full width on mobile */
                }

                .sidenav {
                    width: 250px; /* Set a fixed width for sidenav */
                }

                .cart-sidenav {
                    width: 250px; /* Set a fixed width for cart sidenav */
                }

                .custom-container {
                    padding: 15px; /* Reduce padding for mobile */
                }

                footer {
                    font-size: 0.875rem; /* Decrease footer font size */
                }
            }
        </style>

    </head>

    <body>
    <header style="flex-direction: column; display: flex">
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">

            <div class="container">

                <a class="navbar-brand" href="/">
                    <img src="https://seeklogo.com/images/M/mi-store-logo-51D3C04D50-seeklogo.com.png" alt="">
                    <span class="ms-2">SHOP.KG - Ваш лучший магазин</span>
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarContent">
                    <form class="search-form" id="form-id" action="/found" method="get">
                        <input class="form-control me-2" type="search" name="text" placeholder="Поиск товаров..." aria-label="Search">
                        <button class="btn-warning btn" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>

                    <ul class="navbar-nav ms-auto">
                        <#if user??>
                            <li class="nav-item" style="  padding: 6px;">
                                <a style="color: #333  ;  font-size: 19px; margin: 10px;" href="/basket">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-basket" viewBox="0 0 16 16" style="margin-right: 5px">
                                        <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
                                    </svg> <@spring.message "Basket" /></a>
                            </li>
                            <li class="nav-item" style="font-size: 19px;
  margin: -2px;
  padding-right: 18px;">
                                <a class="nav-link" href="/user/profile">
                                    <i class="fas fa-user"></i> ${(user.userName)!'-- missing --'}
                                </a>
                            </li>
                            <li class="nav-item" style="  margin-right: 14px; padding-left: 12px; padding-top: 4px;">
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
                                <a class="btn btn-login" href="/user/login">
                                    <i class="fas fa-sign-in-alt"></i>
                                    <span style="font-size: 20px;">Войти</span>
                                </a>
                            </li>
                        </#if>
                    </ul>
                </div>
            </div>
        </nav>

<#--        <div id="mySidenav" class="sidenav">-->
<#--            <div class="sidenav-header">-->
<#--                <i class="fas fa-store"></i> Меню-->
<#--            </div>-->
<#--            <a href="#"><i class="fas fa-home"></i> Главная</a>-->
<#--            <a href="#"><i class="fas fa-info-circle"></i> О нас</a>-->
<#--            <a href="#"><i class="fas fa-cogs"></i> Услуги</a>-->
<#--            <a href="#"><i class="fas fa-envelope"></i> Контакты</a>-->
<#--            <div class="sidenav-footer">-->
<#--                <form action="" method="get" class="form-inline">-->
<#--                    <label for="lang_select" class="me-2 text-dark">-->
<#--                        <@spring.message "label.language"/>:-->
<#--                    </label>-->
<#--                    <select name="lang" id="lang_select" class="form-select form-select-sm me-2">-->
<#--                        <option value="">Default</option>-->
<#--                        <option value="" disabled>----------</option>-->
<#--                        <option value="en-US" <#if .locale == "en-US">selected</#if>>American English</option>-->
<#--                        <option value="ru-RU" <#if .locale == "ru-RU">selected</#if>>Русский</option>-->
<#--                    </select>-->
<#--                    <button type="submit" class="btn btn-warning btn-sm">-->
<#--                        <i class="fas fa-language"></i> <@spring.message "button.language-change.text"/>-->
<#--                    </button>-->
<#--                </form>-->
<#--                <p>&copy; 2024 SHOP.KG. Все права защищены.</p>-->
<#--            </div>-->
<#--        </div>-->

<#--        <div id="myCartSidenav" class="cart-sidenav">-->
<#--            <div class="cart-header">-->
<#--                <i class="fas fa-shopping-cart"></i> Корзина-->
<#--            </div>-->
<#--            <div class="cart-content">-->
<#--                <!-- Здесь будет содержимое корзины &ndash;&gt;-->
<#--                <p>Корзина пуста</p>-->
<#--            </div>-->
<#--            <div class="cart-footer">-->
<#--                <button class="btn btn-warning" onclick="toggleCart()">Закрыть</button>-->
<#--            </div>-->
<#--        </div>-->
    </header>
    <main class="custom-container mt-4">
        <#nested>
    </main>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>

    </script>

    </body>
    </html>
</#macro>