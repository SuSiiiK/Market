<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main/>

<@main.renderWith title="Результаты поиска">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                line-height: 1.6;
                color: #333;
                background-color: #f8f9fa; /* Светлый фон для контраста */
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh; /* Минимальная высота для растягивания на весь экран */
            }

            .container {
                max-width: 1360px;
                margin: 0 auto;
                padding: 2rem;
                flex: 1; /* Позволяет контейнеру занимать оставшееся пространство */
                padding-bottom: 80px; /* Добавьте отступ снизу, чтобы контент не перекрывал футер */
            }

            h1 {
                text-align: center;
                margin-bottom: 2rem;
                color: #4a90e2; /* Цвет заголовка */
            }

            .product-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* Адаптивная сетка */
                gap: 1.5rem; /* Промежутки между карточками */
                margin-bottom: 2rem; /* Отступ снизу для сетки продуктов */
            }

            .product-card {
                background-color: #fff; /* Белый фон для карточек */
                border-radius: 8px;
                padding: 1rem;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Тень для карточек */
                transition: transform 0.3s ease, box-shadow 0.3s ease; /* Плавные эффекты */
                text-align: center; /* Центрирование текста */
            }

            .product-card:hover {
                transform: translateY(-5px); /* Подъем карточки при наведении */
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2); /* Увеличение тени при наведении */
            }

            .product-image {
                width: 100%;
                height: auto;
                border-radius: 8px;
                margin-bottom:  1rem;
            }

            .product-title {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: #333; /* Цвет заголовка продукта */
            }

            .product-price {
                font-size: 1.2rem;
                color: #2ecc71; /* Цвет цены */
                margin-bottom: 0.5rem;
            }

            .view-product-btn {
                background-color: #4a90e2;
                color: #fff;
                border: none;
                padding: 0.5rem 1rem;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                font-size: 1rem; /* Размер шрифта кнопки */
            }

            .view-product-btn:hover {
                background-color: #3a7bc8; /* Цвет кнопки при наведении */
            }

            footer {
                background-color: #343a40;
                color: #ffffff;
                padding: 20px 0;
                text-align: center;
                width: 100%; /* Убедитесь, что ширина 100% */
                margin-top: auto; /* Позволяет футеру оставаться внизу */
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
        </style>
    </head>
    <body>
    <div class="container" style="margin-top: 11rem;">
        <h1>Результаты поиска для: "${text}"</h1>
        <div class="product-grid">
            <#list products as product>
                <div class="product-card">
                    <img src="${product.image}" alt="${product.name}" class="product-image">
                    <h2 class="product-title">${product.name}</h2>
                    <div class="product-price">${product.price} <span class="currency">с</span></div>
                    <form action="/product/${product.id}" method="get">
                        <button type="submit" class="view-product-btn">Посмотреть продукт</button>
                    </form>
                </div>
            </#list>
        </div>
    </div>


    </body>
</@main.renderWith>

<footer>
    <p>&copy; 2024 MYSHOP.kg Все права защищены.</p>
    <div class="contact-info">
        <p><i class="fas fa-phone-alt"></i> +996550234543</p>
        <p><i class="fas fa-envelope"></i> myshop@gmail.com</p>
        <p><i class="fas fa-map-marker-alt"></i> Chui prospect, Bishkek, Kyrgiztan</p>
    </div>
</footer>