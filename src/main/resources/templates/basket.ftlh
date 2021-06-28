
<#import "partials/main.ftlh" as main/>

<@main.renderWith>

    <div class="container">
        <div class="card-group">
            <div class="row-4">
                <#list products as product>
                    <div class="col">
                        <div class="card">
                            <img src=${product.product.image} class="card-img-top" alt="${product.product.name}">
                            <div class="card-body">
                                <h5 class="card-title">${product.product.name}</h5>
                                <p class="card-text">${product.product.description}</p>
                                <p class="card-text">Price: ${product.product.price} Som</p>
                                <p class="card-text">Quantity: ${product.product.quantity}</p>
                                <p class="card-text">Category: ${product.product.category.name}</p>
                            </div>
                            <form action="/basket/delete" method="post">

                                <#if _csrf??>
                                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                                           value="${(_csrf.token)!'--no-token--'}"/>
                                </#if>
                                <div>
                                    <input type="hidden" name="productId" value="${product.product.id}">
                                    <button type="submit">DeletefromBasket</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </#list>
            </div>
        </div>

        <div class="card">
            <form action="/basket/order" method="post" style="text-align: center; justify-content: center">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                           value="${(_csrf.token)!'--no-token--'}"/>
                </#if>

                <div>
                    <label class="flex flex-v-center">
                        <p class="label-input-text">Ordering</p>
                        <input type="text" name="name" placeholder="Your-name" value="${(form.name)!''}">
                    </label>
                </div>
                <div>
                    <label class="flex flex-v-center">
                        <input type="text" name="address" placeholder="Your-Email" value="${(form.address)!''}">
                    </label>
                </div>
                <div>
                    <label class="flex flex-v-center">
                        <input type="text" name="tel" placeholder="Your-phone-Number" value="${(form.tel)!''}">
                    </label>
                </div>
                <p>Total : ${form.total} Som </p>
                <div>
                    <input type="hidden" name="total" value="${form.total}">
                    <button type="submit">Order</button>
                </div>
            </form>
        </div>
    </div>
</@main.renderWith>