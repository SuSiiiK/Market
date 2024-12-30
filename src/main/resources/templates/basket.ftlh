<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main/>

<@main.renderWith>
    <style>
        /* Подключение шрифта Roboto из Google Fonts */
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif; /* Применение шрифта Roboto */
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #ff9800;
            color: white;
            padding: 48px;
            text-align: center;
        }

        .container {
            max-width: 1370px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Product Grid Styles */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columns */
            grid-gap: 42px; /* Space between items */
        }

        .product-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column; /* Align items vertically */
            text-align: center; /* Center text */
        }

        .product-card:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .product-image img {
            width: 100%;
            /*height: 200px; !* Fixed height for images *!*/
            object-fit: cover; /* Maintain aspect ratio */
            border-bottom: 1px solid #e0e0e0;
        }

        .product-content {
            padding: 20px;
            flex-grow: 1; /* Allow content to grow and fill space */
        }

        .product-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: #dc3545;
        }

        .product-info {
            display: flex;
            flex-direction: column; /* Stack items vertically */
            align-items: center; /* Center items */
            margin-bottom: 10px;
        }

        .product-info p {
            font-size: 1.3rem;
            color: #666;
            margin: 5px 0; /* Add margin for spacing */
        }

        .delete-form {
            text-align: center; /* Center delete button */
            margin-top: 10px; /* Add margin for spacing */
        }

        .delete-btn {
            display: inline-block;
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 16px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        /* Order Form Styles */
        .order-form {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
        }

        .order-form input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .order-form button {
            background-color: #ff9800;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer ;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .order-form button:hover {
            background-color: #0056b3;
        }

        /* Responsive Styles */
        @media (max-width: 1200px) {
            .product-grid {
                grid-template-columns: repeat(3, 1fr); /* 3 columns for medium screens */
            }
        }

        @media (max-width: 991px) {
            .product-grid {
                grid-template-columns: repeat(2, 1fr); /* 2 columns for smaller screens */
            }
        }

        @media (max-width: 767px) {
            .product-grid {
                grid-template-columns: 1fr; /* 1 column for mobile screens */
            }
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

    <div class="header">
        <h1>Корзина</h1>
    </div>

    <div class="container">
        <div class="product-grid">
            <#list products as product>
                <div class="product-card">
                    <div class="product-image">
                        <img src="${product.product.image}" alt="${product.product.name}">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">${product.product.name}</h3>
                        <div class="product-info">
                            <p class="product-price">Цена: ${product.product.price} Som</p>
                            <p class="product-quantity">Количество: ${product.product.quantity}</p>
                        </div>
                        <form action="/basket/delete" method="post" class="delete-form">
                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <input type="hidden" name="productId" value="${product.product.id}">
                            <button type="submit" class="delete-btn"><@spring.message "DeletefromBasket"/></button>
                        </form>
                    </div>
                </div>
            </#list>
        </div>

        <div class="order-form">
            <h2 style="text-align: center;">Оформление заказа</h2>
            <form action="/basket/order" method="post">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                </#if>
                <div>
                    <label for="name"><@spring.message "Ordering"/>:</label>
                    <input type="text" name="name" placeholder=<@spring.message "Your-name"/> value="${(form.name)!''}">
                </div>
                <div>
                    <label for="address"><@spring.message "Your-Email"/>:</label>
                    <input type="text" name="address" placeholder=<@spring.message "Your-Email"/> value="${(form.address)!''}">
                </div>
                <div>
                    <label for="tel"><@spring.message "Your-phone-Number"/>:</label>
                    <input type="text" name="tel" placeholder=<@spring.message "Your-phone-Number"/> value="${(form.tel)!''}">
                </div>
                <p style="text-align: center;"><@spring.message "Total"/>: ${form.total} <@spring.message "Som"/></p>
                <#--                <input type="number"  name="total" value="${form.total}">-->

                <button type="submit"><@spring.message "Order"/></button>
            </form>
        </div>
    </div>
</@main.renderWith>
<footer>
    <p>&copy; 2024 MYSHOP.kg Все права защищены.</p>
    <div class="contact-info">
        <p><i class="fas fa-phone-alt"></i> +996550234543</p>
        <p><i class="fas fa-envelope"></i> myshop@gmail.com</p>
        <p><i class="fas fa-map-marker-alt"></i> Chui prospect, Bishkek, Kyrgiztan</p>
    </div>
</footer>