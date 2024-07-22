<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mi Shop</title>
</head>
<body>

<#list all as one>
    <div class="card" style="width: 18rem;">
        <img src=${one.product.image} class="card-img-top" alt="${one.product.name}">
        <div class="card-body">
            <h5 class="card-title">${one.product.name}</h5>
            <p class="card-text">${one.user.userName} : ${one.name} date: ${one.date}</p>
        </div>
    </div>
</#list>
</body>
</html>