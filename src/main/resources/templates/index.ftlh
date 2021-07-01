<#import "/spring.ftl" as spring>

<#import "partials/main.ftlh" as main/>
<@main.renderWith>
    <div class="container">
        <div class="card-group">
            <#list products as product>
                <div class="card" style="width: 18rem; padding: 10px">
                    <img src=${product.image} class="card-img-top" alt="${product.name}">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.description}</p>
                        <p class="card-text">${product.price} <@spring.message "Som"/></p>
                        <p class="card-text">${product.quantity}<@spring.message "Qty"/></p>
                        <p class="card-text">${product.category.name}<@spring.message "Type"/></p>
                    </div>
                    <div>
                        <button class="btn btn-warning"><a style="color: black" href="/product/${product.id}"><@spring.message"info"/></a>
                        </button>
                    </div>
                    <div>
                        <#if user??>
                            <form action="/basket/add" method="post">

                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                           value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <div>
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="number" name="qty" placeholder= <@spring.message "Qty"/>>
                                    <button type="submit"><@spring.message "AddToBasket"/></button>
                                </div>
                            </form>
                        </#if>
                    </div>
                </div>
            </#list>
        </div>
    </div>

    <div>
        <#list 1..pages as x>
            <a class="pageButton" href="?page=${x}">${x}</a>
        </#list>
    </div>
</@main.renderWith>



