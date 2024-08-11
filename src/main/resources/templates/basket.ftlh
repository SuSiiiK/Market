<#import "/spring.ftl" as spring>

<#import "partials/main.ftlh" as main/>

<@main.renderWith>
<style>
    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
    }

    /* Product Grid Styles */
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        grid-gap: 30px;
    }

    .product-card {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        transition: all 0.3s ease;
    }

    .product-card:hover {
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        transform: translateY(-5px);
    }

    .product-image img {
        width: 100%;
        height: 200px;
        object-fit: cover;
    }

    .product-content {
        padding: 20px;
    }

    .product-title {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .product-description {
        font-size: 1rem;
        color: #666;
        margin-bottom: 10px;
    }

    .product-info {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        margin-bottom: 10px;
    }

    .product-info p {
        font-size: 1rem;
        color: #666;
    }

    .delete-form {
        text-align: right;
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

    /* Responsive Styles */
    @media (max-width: 991px) {
        .product-grid {
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
        }
    }

    @media (max-width: 767px) {
        .product-grid {
            grid-template-columns: repeat(auto-fit, minmax(100%, 1fr));
        }
    }
</style>
    <div class="container">
        <div class="product-grid">
            <#list products as product>
                <div class="product-card">
                    <div class="product-image">
                        <img src=${product.product.image} alt="${product.product.name}">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">${product.product.name}</h3>
                        <p class="product-description">${product.product.description}</p>
                        <div class="product-info">
                            <p class="product-price"><@spring.message "Som"/> ${product.product.price} Som</p>
                            <p class="product-quantity"><@spring.message"Qty"/> ${product.product.quantity}</p>
                            <p class="product-category"><@spring.message"Type"/> ${product.product.category.name}</p>
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
    </div>

        <div class="card">
            <form action="/basket/order" method="post" style="text-align: center; justify-content: center">
                <#if _csrf??>
                    <input type="hidden" name="${(_csrf.parameterName)!'csrf'}"
                           value="${(_csrf.token)!'--no-token--'}"/>
                </#if>

                <div>
                    <label class="flex flex-v-center">
                        <p class="label-input-text"><@spring.message "Ordering"/></p>
                        <input type="text" name="name" placeholder=<@spring.message"Your-name"/> value="${(form.name)!''}">
                    </label>
                </div>
                <div>
                    <label class="flex flex-v-center">
                        <input type="text" name="address" placeholder=<@spring.message"Your-Email"/> value="${(form.address)!''}">
                    </label>
                </div>
                <div>
                    <label class="flex flex-v-center">
                        <input type="text" name="tel" placeholder=<@spring.message"Your-phone-Number"/> value="${(form.tel)!''}">
                    </label>
                </div>
                <p><@spring.message"Total"/> : ${form.total} <@spring.message"Som"/> </p>
                <div>
                    <input type="hidden" name="total" value=${form.total}>
                    <button type="submit"><@spring.message"Order"/></button>
                </div>
            </form>
        </div>
    </div>
</@main.renderWith>