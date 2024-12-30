<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main/>

<@main.renderWith>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet"
          xmlns="http://www.w3.org/1999/html">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            padding-top: 30px;
        }

        /*.hero-section h1 {*/
        /*    font-size: 4rem;*/
        /*    margin-bottom: 0.5rem;*/
        /*    font-weight: 700;*/
        /*    padding-top: 70px;*/
        /*}*/

        /*.hero-section .btn {*/
        /*    background-color: #ff9800;*/
        /*    border-color: #ff9800;*/
        /*    transition: background-color 0.3s, border-color 0.3s;*/
        /*    font-size: 1.1rem;*/
        /*}*/

        /*.hero-section .btn:hover {*/
        /*    background-color: #e68900;*/
        /*    border-color: #e68900;*/
        /*}*/

        .slide img {
            width: 100%;
            height: auto;
            display: block;
        }

        .slider-nav button {
            background-color: rgba(255, 255, 255, 0.8);
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 20px;
            color: rgba(0, 0, 0, 0.5);
            transition: background-color 0.3s ease;
        }

        .slider-nav button:hover {
            background-color: rgba(255, 255, 255, 0.9);
        }

        .product-slider .slider-wrapper {
            flex-wrap: nowrap;
        }

        .product-slider .slide {
            width: calc(100% / 6); /* Show 6 slides at once */
            padding: 10px;
        }

        .single-card {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            transition: box-shadow 0.3s;
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

        .info {
            padding: 15px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .info h3 {
            margin: 0;
            font-size: 1rem;
            font-weight: 500;
        }

        .add-to-cart i {
            margin-right: 5px;
        }

        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 20px 0;
            text-align: center;
            margin-top: 20px;
            width: 100%; /* Убедитесь, что ширина 100% */
            position: relative; /* Это может помочь, если есть другие элементы, которые могут влиять на позиционирование */
            left: 0;
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

        .textbp img {
            border-radius: 8px;
            width: 100%; /* Изображение занимает всю ширину */
            height: auto; /* Сохраняем пропорции */
            display: block;
        }

        .textbp .overlay {
            position: absolute; /* Абсолютное позиционирование для наложения */
            top: -409px;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: rgba(0, 0, 0, 0.4); /* Темный полупрозрачный фон */
            color: #fff; /* Белый текст */
            border-radius: 8px; /* Повторяем скругление */
            text-align: center;
        }

        .hero-section h1 {
            font-size: 4rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .hero-section p {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .hero-section .btn {
            background-color: #ff9800;
            border-color: #ff9800;
            font-size: 1.1rem;
            padding: 10px 20px;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .hero-section .btn:hover {
            background-color: #e68900;
            border-color: #e68900;
        }

        .explore-products {
            text-align: center; /* Центрируем текст */
            margin-top: 20px; /* Отступ сверху */
            font-size: 2rem; /* Размер шрифта */
            font-weight: 700; /* Жирный шрифт */
            color: #ff9800; /* Цвет текста */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); /* Тень для текста */
            padding-bottom: 38px;
        }

        .explore-products p {
            font-size: 2.2rem; /* Размер шрифта для подзаголовка */
            color: #333; /* Цвет подзаголовка */
            margin-top: 10px; /* Отступ сверху для подзаголовка */
        }

        .wave-divider {
            width: 100%;
            overflow: hidden;
            line-height: 0; /* Убираем высоту строки */
            margin: 40px 0; /* Отступы сверху и снизу */
            position: relative; /* Для абсолютного позиционирования анимации */
            height: 100px; /* Высота волны */
        }

        .wave-divider svg {
            display: block; /* Убираем пробелы под SVG */
            width: calc(100% + 30px); /* Увеличиваем ширину для уменьшения обрезки */
            height: 100%; /* Высота волны */
            margin-left: -15px; /* Сдвиг влево для центрирования */
            animation: wave-pulse 3s ease-in-out infinite; /* Добавляем анимацию */
        }

        .wave {
            fill: #ff9800; /* Цвет волны */
        }

        @keyframes wave-animation {
            0% {
                transform: translateY(0);
            }
            25% {
                transform: translateY(-20px); /* Поднимаем волну вверх */
            }
            50% {
                transform: translateY(0); /* Возвращаем в исходное положение */
            }
            75% {
                transform: translateY(10px); /* Небольшое опускание вниз */
            }
            100% {
                transform: translateY(0); /* Возвращаем в исходное положение */
            }
        }
    </style>



    <div class="textbp">
        <img src="https://softech.kg/image/catalog/Products/Notebook/Xiaomi/Pro%2015%20OLED/5.jpg" alt="Смарт-часы" class="img-responsive">
        <div class="overlay">
            <div class="hero-section">
                <h1>Добро пожаловать в MY SHOP!</h1>
                <p>Откройте для себя наш широкий ассортимент товаров и специальные предложения.</p>
                <a href="/product/list" class="btn btn-warning btn-lg">Просмотреть товары</a>
            </div>
        </div>
    </div>

    <div class="wave-divider">

        <svg viewBox="0 0 1440 320" preserveAspectRatio="none">

            <path class="wave" d="M0,128C60,160,120,192,180,170.7C240,149,300,107,360,117.3C420,128,480,192,540,186.7C600,181,660,128,720,138.7C780,149,840,213,900,202.7C960,192,1020,128,1080,117.3C1140,107,1200,149,1260,165.3C1320,181,1380,149,1410,138.7L1440,128L1440,320L1410,320C1380,320,1320,320,1260,320C1200,320,1140,320,1080,320C1020,320,960,320,900,320C840,320,780,320,720,320C660,320,600,320,540,320C480,320,420,320,360,320C300,320,240,320,180,320C120,320,60,320,30,320H0Z"></path>
        </svg>

    </div>
    <div class="explore-products">
        <h2 style="font-size: 6rem">Explore Products</h2>
        <p>Найдите то, что вам нужно, среди нашего широкого ассортимента!</p>
    </div>

    <div class="textbp" style="padding: 0;  margin-bottom: 20px; justify-content: center; display: flex;">
        <a href="">
            <img style="border-radius: 8px" src="https://xiaomi.kg/image/cache/catalog/amazfit4series-1530x500.png" alt="Смарт-часы" class="img-responsive">
        </a>
    </div>
    <div class="textbp" style="padding: 0;  margin-bottom: 20px; justify-content: center; display: flex;">
        <a href="">
            <img style="border-radius: 8px" src="https://xiaomi.kg/image/cache/catalog/xiaomi_14t_banner-1530x500.jpg" alt="Смарт-часы" class="img-responsive">
        </a>
    </div>

    <div class="explore-products">
        <h2 style="font-size: 6rem ; padding-top: 30px ">Category Products</h2>
        <p>Найди свой желанный товар в наших основных категориях</p>
    </div>


    <div class="container" >
        <div class="row">
            <#list categories as category>
                <div class="col-md-3">
                    <div class="single-card">
                        <a href="/product/list?category=${category.name}" class="img-area">
                            <img src="${category.image}" alt="${category.name}">
                        </a>
                        <div class="info">
                            <h3>${category.name}</h3>
                        </div>
                    </div>
                </div>
            </#list>
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
</@main.renderWith>

