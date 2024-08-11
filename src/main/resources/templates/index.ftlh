<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main/>

<@main.renderWith title="Главная - MI SHOP" dir="ltr">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }

        .container {
            padding-top: 30px;
        }

        .hero-section {
            background: linear-gradient(135deg, #6e5baa); /* Фиолетовый градиент */
            color: #fff;
            padding: 60px 0;
            text-align: center;
            margin-bottom: 40px;
        }

        .hero-section h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .hero-section p {
            font-size: 1.1rem;
        }

        .single-card {
            display: flex;
            flex-direction: column;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            color: #333;
        }

        .single-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .img-area {
            position: relative;
            width: 100%;
            height: 200px;
            overflow: hidden;
        }

        .img-area img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .img-area:hover img {
            transform: scale(1.05);
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 174, 255, 0.8);
            opacity: 0;
            transition: opacity 0.3s ease;
            text-align: center;
            padding: 10px;
        }

        .single-card:hover .overlay {
            opacity: 1;
        }

        .add-to-card, .view-details {
            background-color: #fff;
            color: #000;
            padding: 8px 12px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
            margin: 5px;
        }

        .add-to-card:hover, .view-details:hover {
            background-color: darkorange;
            color: #fff;
            border: none;
        }

        .info {
            padding: 15px;
            text-align: center;
            color: #333;
            flex-grow: 1; /* Заполняет доступное пространство */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .info h3 {
            margin: 10px 0;
            font-size: 1.2rem;
            font-weight: bold;
            text-transform: uppercase;
        }

        .info .price {
            margin: 10px 0;
            font-size: 1.2rem;
            font-weight: bold;
            color: #6e5baa;
        }

        .pagination {
            margin: 20px 0;
        }

        .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }

        .page-link {
            border-radius: 0;
        }

        .page-link, .page-link:hover {
            color: #007bff;
            background-color: #fff;
            border: 1px solid #007bff;
        }

        .page-item {
            margin: 0 2px;
        }

        /* Адаптивные стили для изображений */
        @media (max-width: 767px) {
            .img-area {
                height: 150px; /* Уменьшить высоту на маленьких экранах */
            }
            .info h3 {
                font-size: 1rem;
            }
            .info .price {
                font-size: 1rem;
            }
        }
    </style>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1>Добро пожаловать в MY SHOP!</h1>
            <p>Откройте для себя наш широкий ассортимент товаров и специальные предложения.</p>
            <a href="/products" class="btn #4a00e0 color btn-lg">Просмотреть товары</a>
        </div>
    </section>

    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
            <#list products as product>
                <div class="col d-flex">
                    <div class="single-card d-flex flex-column">
                        <div class="img-area">
                            <img src="${product.image}" alt="${product.name}">
                            <div class="overlay">
                                <button class="add-to-card">Add to card</button>
                                <button class="view-details" data-bs-toggle="modal" data-bs-target="#productModal"
                                        data-product-id="${product.id}" data-product-name="${product.name}"
                                        data-product-image="${product.image}"
                                        data-product-description="${product.description}"
                                        data-product-price="${product.price}"
                                        data-product-quantity="${product.quantity}">
                                    View Details
                                </button>
                            </div>
                        </div>
                        <div class="info">
                            <h3>${product.name}</h3>
                            <p class="price">${product.price} <@spring.message "Som"/></p>
                            <#-- <p>${product.description?truncate(100)}</p> -->
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>

    <nav aria-label="Page navigation" class="mt-4">
        <ul class="pagination justify-content-center">
            <#list 1..pages as x>
                <li class="page-item ">
                    <a class="page-link" href="?page=${x}">${x}</a>
                </li>
            </#list>
        </ul>
    </nav>

    <!-- Modal Template -->
    <div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="productModalLabel">Product Title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <img src="" class="img-fluid mb-3" alt="Product Image">
                    <p>Product description goes here...</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var productModal = document.getElementById('productModal');
            productModal.addEventListener('show.bs.modal', function (event) {
                var button = event.relatedTarget; // Button that triggered the modal
                var productId = button.getAttribute('data-product-id');
                var productName = button.getAttribute('data-product-name');
                var productImage = button.getAttribute('data-product-image');
                var productDescription = button.getAttribute('data-product-description');
                var productPrice = button.getAttribute('data-product-price');
                var productQuantity = button.getAttribute('data-product-quantity');

                var modalTitle = productModal.querySelector('.modal-title');
                var modalBody = productModal.querySelector('.modal-body');

                modalTitle.textContent = productName;
                modalBody.innerHTML = '<img src="' + productImage + '" class="img-fluid mb-3" alt="Product Image">' +
                    '<p>' + productDescription + '</p>' +
                    '<p><strong>Price:</strong> ' + productPrice + '</p>' +
                    '<p><strong>Quantity:</strong> ' + productQuantity + '</p>';
            });
        });
    </script>
</@main.renderWith>

