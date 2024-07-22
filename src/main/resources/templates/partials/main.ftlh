<#macro renderWith title="MI SHOP" dir="ltr" >
    <!doctype html>
    <html lang="${.locale}" dir="${dir}">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
              crossorigin="anonymous">
        <#--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />-->

        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background: linear-gradient(to right, #ff6b6b, #ffa500, #ffff00, #00ff00, #00ffff, #0000ff, #ff00ff);
                background-size: 400% 400%;
                /*animation: gradient 30s ease alternate-reverse;*/
            }

            /*@keyframes gradient {*/
            /*    0% {*/
            /*        background-position: 0% 50%;*/
            /*    }*/
            /*    50% {*/
            /*        background-position: 100% 50%;*/
            /*    }*/
            /*    100% {*/
            /*        background-position: 0% 50%;*/
            /*    }*/
            /*}*/

            .navigation {
                background-color: rgba(255, 255, 255, 0.8);
                color: #333;
                padding: 15px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .navbar-nav .nav-link {
                color: #333;
                font-weight: bold;
            }

            .header-logo img {
                max-width: 100px;
            }

            .form-control, .form-select {
                border-radius: 20px;
                border: none;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .btn-warning {
                background-color: darkorange;
                border-color: #ffc107;
                color: #333;
                border-radius: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .btn-warning:hover {
                background-color: #e0a800;
                border-color: #d39e00;
            }
        </style>

        <title>${title}</title>

    </head>

    <body class="body animate__animated animate__fadeIn">

    <div class="navigation">
        <nav class="navbar navbar-expand-lg" style="padding-bottom: 0">
            <ul class="navbar-nav me-auto mx-auto">
                <div class="header-logo">
                    <a href="/">
                        <img src="https://www.promkod.ru/storage/shop/mi-shop-com/mi-shop-list.jpeg" height="60"
                             alt=""></a>
                </div>
                <a href="/" style="color: orange"><h2 style="padding-right:30px; padding-top: 0px ">SHOP.KG</h2></a>
                <li>
                    <form class="row g-4" style="justify-content: center" id="form-id">
                        <div class="col-auto">
                            <input type="text" class="form-control" name="text" id="input"
                                   placeholder="<@spring.message "search"/>" onfocus="this.value=''" autofocus>
                        </div>
                        <div class="col-auto">
                            <select class="form-select" name="param" aria-label="Default select example">
                                <option value="name"><@spring.message "search-name"/></option>
                                <option value="type"><@spring.message "search-Type"/></option>
                            </select>
                        </div>
                        <div class="col-auto">
                            <button type="submit" formaction="/found"
                                    class="btn btn-warning mb-3"><@spring.message "search"/>
                            </button>
                        </div>
                    </form>
                </li>
                <li style="padding-left: 10px">
                    <div>
                        <#if user??>
                            <button class="btn btn-warning"><a style="color: #333" href="/basket">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-basket" viewBox="0 0 16 16" style="margin-right: 5px">
                                        <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"/>
                                    </svg> <@spring.message "Basket" /></a></button>
                            <button class="btn btn-warning"><a style="color: #333"
                                                               href="/user/profile">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-person" viewBox="0 0 16 16" style="margin-right: 5px">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                    </svg>${(user.userName)!'-- missing --'}
                                </a></button>
                        <#else>
                            <button class="btn btn-warning"><a style="color: #333"
                                                               href="/user/login"><@spring.message "LogIn"/></a>
                            </button>
                        </#if>
                    </div>
                </li>
                <li style="padding-left: 10px">
                    <#if user??>
                        <form action="/logout" method="post">

                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                       value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <button class="btn btn-warning" type="submit">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-box-arrow-right" viewBox="0 0 16 16" style="margin-right: 3px">
                                    <path fill-rule="evenodd"
                                          d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                                    <path fill-rule="evenodd"
                                          d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                </svg>
                                LogOut
                            </button>
                        </form>
                    </#if>
                </li>
            </ul>
        </nav>
    </div>
    <main>
        <#nested>
        <div>
            <form action="" method="get" class="my-3">
                <label for="lang_select">
                    <@spring.message "label.language"/>:
                </label>
                <select name="lang" id="lang_select">
                    <option value="">Default</option>
                    <option value="" disabled>----------</option>
                    <option value="en-US">American English</option>
                    <option value="ru-RU">Русский</option>
                </select>
                <button type="submit" class="btn btn-warning">
                    <@spring.message "button.language-change.text"/>
                </button>
            </form>
        </div>
    </main>


    </body>
    </html>

</#macro>