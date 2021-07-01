<#import "/spring.ftl" as spring />

<#macro renderWith title="MI SHOP" dir="ltr"  >
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

        <title>${title}</title>

    </head>

    <body class="body">

    <div class="navigation">
        <nav class="navbar navbar-expand-lg" style="background: #bfa58c;">
            <ul class="navbar-nav me-auto mx-auto">
                <div class="header-logo">
                    <a href="/">
                        <img src="https://www.promkod.ru/storage/shop/mi-shop-com/mi-shop-list.jpeg" height="60"
                             alt=""></a>
                </div>
                <h2 style="padding-right:30px; padding-top: 8px ">SHOP.KG</h2>
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
                            <button class="btn btn-warning"><a style="color: black" href="/basket"> <@spring.message "Basket" /></a></button>
                            <button class="btn btn-warning"><a style="color: black"
                                                               href="/user/profile">${(user.userName)!'-- missing --'}
                                    - ${(user.email)!'-- email missing --'}</a></button>
                        <#else>
                            <button class="btn btn-warning"><a style="color: black"
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
                            <button class="btn btn-warning" type="submit">LogOut</button>
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
                <button type="submit">
                    <@spring.message "button.language-change.text"/>
                </button>
            </form>
        </div>
    </main>
    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>

    </body>
    </html>
</#macro>