<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main/>

<@main.renderWith>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<#--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

    <title>Product Page</title>
    <style>
        body {
            font-family: 'MiSans', sans-serif;
            background: #f5f5f5;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            letter-spacing: 1px;
        }

        .container {
            flex: 1;
            padding: 30px;
            border-radius: 8px;
        }

        .filter-section {
            background: transparent;
            padding: 20px;
            margin-bottom: 20px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .filter-section h4 {
            margin-bottom: 15px;
            font-weight: 500;
        }

        .category-list {
            list-style: none;
            padding: 0;
        }

        .category-list li {
            margin-bottom: 10px;
            position: relative;
        }

        .category-list a {
            text-decoration: none;
            color: #333;
            font-weight: 600;
            display: block;
            padding: 6px 12px;
            border-radius: 12px;
            transition: color 0.3s, transform 0.3s, box-shadow 0.3s;
            background: #FFFFFF;
            font-size: 0.875rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-transform: uppercase !important;
        }

        .category-list a.active {
            color: darkorange;
            font-weight: 500;
            box-shadow: 0 0 0 2px rgba(255, 140, 0, 0.3);
            transform: translateY(-2px);
        }

        .category-list a:hover {
            color: darkorange;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .filter-controls {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            gap: 15px;
            margin-top: 67px;
            background-color: #fff;
            border-radius: 20px;
            font-size: 15px;
            padding: 8px 18px 10px 12px;
        }

        .filter-controls label {
            margin-right: 10px;
            font-weight: 500;
        }

        .filter-controls select {
            border-radius: 50px;
            padding: 8px 12px;
            border: 1px solid #ced4da;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s;
        }

        .filter-controls select:focus {
            outline: none;
            border-color: #007bff;
        }

        .single-card {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            transition: box-shadow 0.3s;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .single-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .img-area {
            position: relative;
            overflow: hidden;
        }

        .img-area img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-bottom: 1px solid #e0e0e0;
        }

        .product-title {
            padding: 15px;
            font-size: 1rem;
            font-weight: 500;
        }

        .info {
            padding: 15px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
            box-sizing: border-box;
        }

        .price {
            color: #333;
            font-weight: 700;
            font-size: 1.1rem;
            margin-top: auto;
            text-align: right;
        }



        .add-to-cart i {
            margin-right: 5px;
        }

        .pagination {
            margin-top: 40px;
            padding: 10px 0;
        }

        .pagination .page-item {
            margin: 0;
        }

        .pagination .page-link {
            border-radius: 50%;
            padding: 8px 16px;
            font-size: 1rem;
            transition: background 0.3s, color 0.3s;
            color: #007bff;
            border: 1px solid #007bff;
        }

        .pagination .page-link:hover {
            background: #007bff;
            color: #fff;
        }

        .pagination .page-item.active .page-link {
            background: #007bff;
            color: #fff;
            border-color: #007bff;
        }

        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px 0;
            text-align: center;
            width: 100%;
            margin-top: auto;
        }

        footer .social-icons {
            margin-bottom: 10px;
        }

        footer .social-icons a {
            color: #ffffff;
            margin: 0 10px;
            font-size: 1.5rem;
            text-decoration: none;
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

        hr {
            margin: 3px 0px 27px;
        }

        .span-category {
            padding: 10px 8px 14px;
        }

        .add-to-basket-form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 10px;
        }


        .qty-input:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 4px rgba(0, 123, 255, 0.4);
        }

        .btn-add-to-basket {
            background-color: #f57c00;
            color: white;
            font-size: 0.8rem;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .btn-add-to-basket i {
            margin-right: 8px;
            font-size: 1.3rem;
        }

        .btn-add-to-basket:hover {
            background-color: #e65100;
            transform: translateY(-2px);
        }

        .btn-add-to-basket:active {
            background-color: #d84315;
            transform: translateY(1px);
        }

        /* Ensures the form fits in well with the card layout */
        .single-card .info {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            flex-grow: 1;
        }
    </style>
</head>
<body>
 <div class="container mt-4">
    <div class="row">
        <!-- Filter Section -->
        <div class="col-md-3" style="padding-top: 105px;">
            <div class="filter-section">
                <div class="span-category">
                    <a href="/" style="color: #333"><i class="fa fa-home"> | </i></a>
                    <span style="padding: 4px; font-size: 13px;">
                            <#if selectedCategory??>${selectedCategory}<#else>All Categories</#if> <!-- Выбранная категория -->
                        </span>
                </div>

                <ul class="category-list">
                    <#list categories as category>
                        <li>
                            <a href="/product/list?category=${category.name}"
                               class="category-link <#if category.name == selectedCategory>active</#if>">
                                ${category.name}
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>

        <!-- Product Grid -->
        <div class="col-md-9" style="padding-top: 100px;">
            <div class="filter-controls">
                <label for="sortSelect">Sort by:</label>
                <select class="form-select" id="sortSelect" onchange="applyFilters()">
                    <option value="name-asc">Name (A-Z)</option>
                    <option value="name-desc">Name (Z-A)</option>
                    <option value="price-asc">Price (Low to High)</option>
                    <option value="price-desc">Price (High to Low)</option>
                </select>

                <label for="itemsPerPage">Show:</label>
                <select class="form-select" id="itemsPerPage" onchange="applyFilters()">
                    <option value="15">15 Items per Page</option>
                    <option value="20">20 Items per Page</option>
                    <option value="40">40 Items per Page</option>
                    <option value="50">50 Items per Page</option>
                </select>
            </div>
            <div id="productGrid" class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                <#list products as product>
                    <div class="col">
                        <div class="single-card">
                            <a href="/product/${product.id}" class="img-area">
                                <img src="${product.image}" alt="${product.name}">
                            </a>
                            <div class="product-title">${product.name}</div>
                            <div class="info">
                                <p class="price">${product.price} <@spring.message "Som"/></p>
                                <hr class="hr">
                                <#if user??>
                                    <form action="/basket/add" method="post" class="add-to-basket-form">
                                        <#if _csrf??>
                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}" />
                                        </#if>
                                        <div class="form-group">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <input type="number" name="qty" class="form-control qty-input" placeholder="<@spring.message 'Qty'/>">
                                        </div>
                                        <button type="submit" class="btn-add-to-basket">
                                            <i class="fas fa-cart-plus"></i> <@spring.message "AddToBasket"/>
                                        </button>
                                    </form>
                                </#if>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>

            <!-- Pagination -->
            <nav aria-label="Page navigation" class="pagination">
                <ul class="pagination justify-content-start">
                    <#list 1..totalPages as x>
                        <li class="page-item <#if x == currentPage>active</#if>">
                            <a class="page-link" href="?page=${x}">${x}</a>
                        </li>
                    </#list>
                </ul>
            </nav>
        </div>
    </div>
</div>
 <footer>
     <p>&copy; 2024 MYSHOP.kg Все права защищены.</p>
     <div class="contact-info">
         <p><i class="fas fa-phone-alt"></i> +996550234543</p>
         <p><i class="fas fa-envelope"></i> myshop@gmail.com</p>
         <p><i class="fas fa-map-marker-alt"></i> Chui prospect, Bishkek, Kyrgiztan</p>
     </div>
 </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function applyFilters() {
        const sortValue = document.getElementById('sortSelect').value;
        const itemsPerPage = document.getElementById('itemsPerPage').value;

        // Get product data (assuming the product data is available in a variable products)
        const productGrid = document.getElementById('productGrid');
        let products = Array.from(productGrid.children);

        // Sort products based on the selected option
        products.sort((a, b) => {
            const aName = a.querySelector('.product-title').textContent;
            const bName = b.querySelector('.product-title').textContent;
            const aPrice = parseFloat(a.querySelector('.price').textContent.replace(/[^0-9.-]+/g, ''));
            const bPrice = parseFloat(b.querySelector('.price').textContent.replace(/[^0-9.-]+/g, ''));

            if (sortValue === 'name-asc') {
                return aName.localeCompare(bName);
            } else if (sortValue === 'name-desc') {
                return bName.localeCompare(aName);
            } else if (sortValue === 'price-asc') {
                return aPrice - bPrice;
            } else if (sortValue === 'price-desc') {
                return bPrice - aPrice;
            }
            return 0;
        });

        // Clear the current grid
        productGrid.innerHTML = '';

        // Add sorted products back to the grid
        products.forEach((product, index) => {
            if (index < itemsPerPage) {
                productGrid.appendChild(product);
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function () {
        var productModal = document.getElementById('productModal');
        productModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
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
</body>
</@main.renderWith>
