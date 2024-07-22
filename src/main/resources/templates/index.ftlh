<#import "/spring.ftl" as spring>

<#import "partials/main.ftlh" as main/>
<@main.renderWith>
    <style>
        .container {
            margin: 0 auto;
            max-width: 1000px;

            /*padding: 0 20px;*/
            width: 100%;

        }

        .cards {
            padding: 75px 0;
        }

        .container_cards {

            display: flex;
            /* Автоматически заполняем на всю ширину grid-контейнера */
            grid-template-columns: repeat(auto-fill, 225px);
            width: 100%;
            flex-wrap: wrap;
            /*justify-content: space-between;*/

            max-width: 1000px; /* Ширина grid-контейнера */
            justify-content: center;
            justify-items: center; /* Размещаем карточку по центру */
            column-gap: 30px; /* Отступ между колонками */
            row-gap: 40px; /* Отступ между рядами */
            margin: 0 auto;

        }

        .card-group {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: -10px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 16px;
            margin: 16px;
            width: 200px;
            height: 250px;
        }

        /*.card:hover {*/
        /*    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);*/
        /*}*/

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-image {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 4px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 12px;
        }


        .card-text {
            font-size: 1rem;
            color: #6c757d;
            margin-bottom: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        /*.add-to-basket-container {*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*    margin-top: 1rem;*/
        /*}*/

        .add-to-basket-form {
            display: flex;
            align-items: center;
        }

        .add-to-basket-form .form-group {
            margin-right: 1rem;
        }

        .add-to-basket-form .form-control {
            width: 80px;
            height: 40px;
            font-size: 1rem;
            padding: 0.5rem;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }

        .add-to-basket-form .btn {
            height: 40px;
            font-size: 1rem;
            padding: 0.5rem 1rem;
        }

        /*-----*/
        /*.cards {*/
        /*    background-color: #f8f9fa;*/
        /*    padding: 50px 0;*/
        /*}*/

        /*.container_cards {*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*}*/

        /*.card-group {*/
        /*    display: grid;*/
        /*    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));*/
        /*    grid-gap: 30px;*/
        /*}*/
        .container {
            padding-top: 50px;
        }
        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        /*.card {*/
        /*    border: none;*/
        /*    border-radius: 10px;*/
        /*    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        /*    transition: transform 0.3s ease;*/
        /*}*/

        .card:hover {
            transform: translateY(-5px);
        }

        .card-img-top {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            /*height: 200px;*/
            object-fit: cover;
        }

        .card-body {
            padding: 1.5rem;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .card-text {
            font-size: 0.9rem;
            color: #6c757d;
            margin-bottom: 0.5rem;
        }

        .card-footer {
            background-color: #f8f9fa;
            border-top: none;
            padding: 1rem 1.5rem;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }


        .btn-warning {
            color: #212529;
            background-color: #ffc107;
            border-color: #ffc107;
        }



        .btn-primary {
            background-color: #ff9800;
            border-color: #ff9800;
        }

        .form-control {
            border-radius: 5px;
            font-size: 0.9rem;
        }




    </style>
<#--    <section class="cards">-->
<#--        <div class="container container_cards" style="padding-top: 50px;">-->
<#--            <div class="card-group">-->
<#--                <#list products as product>-->
<#--                    <div class="card">-->
<#--                        <!-- Верхняя часть &ndash;&gt;-->
<#--                        <div class="card__top">-->
<#--                            <!-- Изображение-ссылка товара &ndash;&gt;-->
<#--                            <a href="#" class="card__image">-->
<#--                                <img src="${product.image}" class="card-img-top" alt="${product.name}">-->
<#--                            </a>-->
<#--                            <!-- Скидка на товар &ndash;&gt;-->
<#--                            <div class="card__label">-10%</div>-->
<#--                        </div>-->
<#--                        <!-- Нижняя часть &ndash;&gt;-->
<#--                        <div class="card__bottom">-->
<#--                            <!-- Цены на товар (с учетом скидки и без)&ndash;&gt;-->
<#--                            <div class="card__prices">-->
<#--                                <p class="card__price card__price--common">${product.price} <@spring.message "Som"/></p>-->
<#--                            </div>-->
<#--                            <!-- Ссылка-название товара &ndash;&gt;-->
<#--                            <a href="#" class="card__title">-->
<#--                                <h5 class="card-title">${product.name}</h5>-->
<#--                            </a>-->
<#--                            <#if user??>-->
<#--                                <form action="/basket/add" method="post" class="add-to-basket-form">-->
<#--                                    <#if _csrf??>-->
<#--                                        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}" />-->
<#--                                    </#if>-->
<#--                                    <div class="form-group">-->
<#--                                        <input type="hidden" name="productId" value="${product.id}">-->
<#--                                        <input type="number" name="qty" class="form-control" placeholder="<@spring.message 'Qty'/>">-->
<#--                                    </div>-->
<#--                                    <button type="submit" class="card__add" style="color: black; background-color: orange"><@spring.message "AddToBasket"/></button>-->
<#--                                </form>-->
<#--                            </#if>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </#list>-->
<#--            </div>-->
<#--        </div>-->
<#--    </section>-->


<#--    </div>-->
    <div class="container" style="padding-top: 50px">
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <#list products as product>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card h-100 w-100">
                        <img src="${product.image}" class="card-img-top img-fluid" alt="${product.name}">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="card-text">
                                <span class="fw-bold">${product.price}</span> <@spring.message "Som"/>
                            </p>
                            <p class="card-text">
                                <span class="fw-bold">${product.quantity}</span> <@spring.message "Qty"/>
                            </p>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="/product/${product.id}" class="btn btn-warning">
                                    <@spring.message "info"/>
                                </a>
                                <#if user??>
                                    <form action="/basket/add" method="post" class="add-to-basket-form">
                                        <#if _csrf??>
                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                                   value="${(_csrf.token)!'--no-token--'}"/>
                                        </#if>
                                        <div class="form-group">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <input type="number" name="qty" class="form-control"
                                                   placeholder="<@spring.message 'Qty'/>">
                                        </div>
                                        <button type="submit" class="btn btn-primary"
                                                style="background-color: orange; color: black;">
                                            <@spring.message "AddToBasket"/>
                                        </button>
                                    </form>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>

    <div class="pagination-container">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <#list 1..pages as x>
                    <li class="page-item">
                        <a class="page-link" href="?page=${x}">${x}</a>
                    </li>
                </#list>
            </ul>
        </nav>
    </div>

    <style>
        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .page-item {
            margin: 0 5px;
        }

        .page-link {
            display: block;
            padding: 10px 15px;
            text-decoration: none;
            color: #333;
            background-color: #f2f2f2;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .page-link:hover {
            background-color: #ddd;
        }

        .page-item.active .page-link {
            background-color: #007bff;
            color: #fff;
        }
    </style>

<#--    <script>-->
<#--        // Добавляем обработчики событий для кликов на страницы-->
<#--        document.querySelectorAll('.page-link').forEach(link => {-->
<#--            link.addEventListener('click', (event) => {-->
<#--                event.preventDefault();-->
<#--                const page = event.target.textContent;-->
<#--                // Здесь вы можете добавить код для обновления содержимого страницы-->
<#--                console.log(`Переход на страницу ${pages}`);-->
<#--            });-->
<#--        });-->
<#--    </script>-->
</@main.renderWith>



