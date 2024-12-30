<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main/>

<@main.renderWith>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${product.name} - Product Page</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #4a90e2;
                --secondary-color: #f5f5f5;
                --text-color: #333;
                --light-gray: #e0e0e0;
            }

            body {
                font-family: 'Arial', sans-serif;
                line-height: 1.6;
                color: var(--text-color);
                background-color: #fff;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                min-height: 100vh; /* Убедитесь, что контент не выходит за пределы */
            }

            .container {
                max-width: 1360px;
                margin: 0 auto;
                padding: 2rem;
                flex-grow: 1; /* Контейнер будет расширяться */
            }

            .product-page {
                display: flex;
                flex-wrap: wrap;
                gap: 3rem;
            }

            .product-gallery {
                flex: 1;
                max-width: 40%;
            }

            .product-image {
                width: 100%;
                height: auto;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
            }

            .product-image:hover {
                transform: scale(1.05);
            }

            .product-content {
                flex: 1;
                max-width: 60%;
            }

            .product-title {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 1rem;
                color: var(--primary-color);
            }

            .product-price {
                font-size: 2rem;
                font-weight: 600;
                color: #2ecc71;
                margin-bottom: 1rem;
            }

            .product-description {
                font-size: 1rem;
                line-height: 1.8;
                margin-bottom: 2rem;
            }

            .product-meta {
                display: flex;
                gap: 2rem;
                margin-bottom: 2rem;
            }

            .meta-item {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .meta-item i {
                color: var(--primary-color);
            }

            .quantity-controls {
                display: flex;
                align-items: center;
                gap: 1rem;
                margin-bottom: 2rem;
            }

            .quantity-btn {
                background-color: var(--secondary-color);
                border: none;
                color: var(--text-color);
                font-size: 1.2rem;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .quantity-btn:hover {
                background-color: var(--light-gray);
            }

            .quantity-input {
                width: 60px;
                text-align: center;
                font-size: 1rem;
                border: 1px solid var(--light-gray);
                border-radius: 4px;
                padding: 0.5rem;
            }

            .add-to-cart-btn {
                background-color: var(--primary-color);
                color: #fff;
                border: none;
                padding: 1rem 2rem;
                font-size: 1rem;
                font-weight: 600;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .add-to-cart-btn:hover {
                background-color: #3a7bc8;
            }

            .product-features {
                margin-top: 3rem;
            }

            .feature-title {
                font-size: 1.5rem;
                font-weight: 600;
                margin-bottom: 1rem;
            }

            .feature-list {
                list-style-type: none;
                padding: 0;
            }

            .feature-item {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                margin-bottom: 0.5rem;
            }

            .feature-item i {
                color: #2ecc71;
            }

            .reviews-section {
                margin-top: 3rem;
            }

            .review-card {
                background-color: var(--secondary-color);
                border-radius: 8px;
                padding: 1.5rem;
                margin-bottom: 1rem;
            }

            .review-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1rem;
            }

            .reviewer-name {
                font-weight: 600;
            }

            .review-date {
                color: #777;
                font-size: 0.9rem;
            }

            .review-text {
                line-height: 1.6;
            }

            .payment-options {
                display: flex;
                gap: 1rem;
                margin-top: 2rem;
            }

            .payment-option {
                max-width: 80px;
                opacity: 0.7;
                transition: opacity 0.3s ease;
            }

            .payment-option:hover {
                opacity: 1;
            }

            footer {
                background-color: #343a40;
                color: #ffffff;
                padding: 20px 0;
                text-align: center;
                width: 100%;
                margin-top: auto; /* Pushes footer to the bottom */
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
    <div class="container" style="padding-top: 171px;">
        <div class="product-page">
            <div class="product-gallery">
                <img src="${product.image}" alt="${product.name}" class="product-image">
            </div>
            <div class="product-content">
                <h1 class="product-title">${product.name}</h1>
                <div class="product-price">${product.price} <span class="currency">с</span></div>
                <p class="product-description">Experience the power and versatility of the ${product.name}. This cutting-edge product is designed to enhance your daily life with its innovative features and sleek design.</p>
                <div class="product-meta">
                    <div class="meta-item">
                        <i class="fas fa-check-circle"></i>
                        <span>In Stock</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-truck"></i>
                        <span>Free Shipping</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-undo"></i>
                        <span>30-Day Returns</span>
                    </div>
                </div>
                <form action="/basket/add" method="post">
                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                    </#if>
                    <input type="hidden" name="productId" value="${product.id}">
                    <button type="submit" class="add-to-cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</button>
                </form>
                <div class="product-features">
                    <h2 class="feature-title">Key Features</h2>
                    <ul class="feature-list">
                        <li class="feature-item"><i class="fas fa-star"></i> High-quality build and materials</li>
                        <li class="feature-item"><i class="fas fa-star"></i> Energy-efficient design</li>
                        <li class="feature-item"><i class="fas fa-star"></i> User-friendly interface</li>
                        <li class="feature-item"><i class="fas fa-star"></i> Compatible with smart home systems</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="reviews-section">
            <h2 class="feature-title">Customer Reviews</h2>
            <#if reviews??>
                <#list reviews as one>
                    <div class="review-card">
                        <div class="review-header">
                            <span class="reviewer-name">${one.user.userName}</span>
                            <span class="review-date">${one.date}</span>
                        </div>
                        <p class="review-text">${one.name}</p>
                    </div>
                </#list>
            </#if>
            <div class="review-form">
                <h2 class="feature-title">Write a Review</h2>
                <form action="/basket/review" method="post">
                    <#if _csrf??>
                        <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                    </#if>
                    <div class="form-group">
                        <label for="reviewText">Your Review</label>
                        <textarea id="reviewText" name="text" class="form-control" rows="3" placeholder="Share your thoughts about the product"></textarea>
                    </div>
                    <input type="hidden" name="productId" value="${product.id}">
                    <button type="submit" class="add-to-cart-btn" style="margin-top: 18px;">Submit Review</button>
                </form>
            </div>

        </div>
    </div>



    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

    </body>

</@main.renderWith>
<footer>
    <p>&copy; 2024 MYSHOP.KG. Все права защищены.</p>
    <div class="contact-info">
        <p><i class="fas fa-phone-alt"></i> +996550322543</p>
        <p><i class="fas fa-envelope"></i> info@myshop.kg</p>
        <p><i class="fas fa-map-marker-alt"></i> 1234 Street Name, City, Country</p>
    </div>
</footer>