<#import "/spring.ftl" as spring>
<#import "partials/main.ftlh" as main/>

<@main.renderWith>

    <style>
        .card {
            border: none;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            border-radius: 10px;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 10px;
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
    </style>

    <div class="container my-5">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <img src="${product.image}" class="card-img-top product-image" alt="${product.name}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.description}</p>
                        <p class="card-text">
                            <strong><@spring.message "Price"/>:</strong> ${product.price} <@spring.message "Som"/>
                        </p>
                        <p class="card-text">
                            <strong><@spring.message "Qty"/>:</strong> ${product.quantity}
                        </p>
                        <p class="card-text">
                            <strong><@spring.message "Type"/>:</strong> ${product.category.name}
                        </p>

                        <#if user??>
                            <form action="/basket/add" method="post" class="mt-4">
                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <input type="hidden" name="productId" value="${product.id}">
                                <button type="submit" class="btn btn-primary"><@spring.message "AddToBasket"/></button>
                            </form>

                            <#if addReview??>
                                <div class="review-form mt-4">
                                    <h5><@spring.message "WriteReview"/></h5>
                                    <form action="/basket/review" method="post">
                                        <#if _csrf??>
                                            <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                                        </#if>
                                        <div class="form-group">
                                            <label><@spring.message "text"/></label>
                                            <textarea name="text" class="form-control" rows="3" placeholder=<@spring.message "text"/>></textarea>
                                        </div>
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <button type="submit" class="btn btn-primary"><@spring.message "AddReview"/></button>
                                    </form>
                                </div>
                            </#if>
                        </#if>
                    </div>
                </div>
            </div>
        </div>

        <#if reviews??>
            <div class="mt-4">
                <h5><@spring.message "Reviews"/></h5>
                <#list reviews as one>
                    <div class="card mb-3">
                        <div class="card-body">
                            <p class="card-text">${one.user.userName} : ${one.name} <small class="text-muted">date: ${one.date}</small></p>
                        </div>
                    </div>
                </#list>
            </div>
        </#if>
    </div>
</@main.renderWith>