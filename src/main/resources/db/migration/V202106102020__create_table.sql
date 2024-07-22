CREATE TABLE categories (
                            id BIGSERIAL PRIMARY KEY,
                            name VARCHAR(255)
);

CREATE TABLE users (
                       id BIGSERIAL PRIMARY KEY,
                       email VARCHAR(255),
                       enabled BOOLEAN,
                       password VARCHAR(255),
                       role VARCHAR(128),
                       user_name VARCHAR(255)
);

CREATE TABLE products (
                          id BIGSERIAL PRIMARY KEY,
                          description VARCHAR(255),
                          image VARCHAR(255) NOT NULL,
                          name VARCHAR(255) NOT NULL,
                          price DOUBLE PRECISION NOT NULL,
                          quantity INTEGER NOT NULL,
                          category_id BIGINT NOT NULL,
                          CONSTRAINT FKteg3f0l6cndtbn3nsbr1tmxcl FOREIGN KEY (category_id) REFERENCES categories (id)
);

CREATE TABLE reviews (
                         id BIGSERIAL PRIMARY KEY,
                         date DATE,
                         name VARCHAR(255),
                         product_id BIGINT,
                         user_id BIGINT,
                         CONSTRAINT FK81nkg9op14w8c6hw7f25f029i FOREIGN KEY (product_id) REFERENCES products (id),
                         CONSTRAINT FKcgy7qjc1r99dp117y9en6lxye FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE baskets (
                         id BIGSERIAL PRIMARY KEY,
                         session VARCHAR(255),
                         user_id BIGINT,
                         CONSTRAINT FK87s17cinc4wkx0taas5nh0s8h FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE basket_products (
                                 id BIGSERIAL PRIMARY KEY,
                                 qty INTEGER,
                                 basket_id BIGINT,
                                 product_id BIGINT,
                                 CONSTRAINT FKlomoboid5pugq7ajp2kvqe5id FOREIGN KEY (basket_id) REFERENCES baskets (id),
                                 CONSTRAINT FKs86tjrwd3ex57i294fpntxuc6 FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE orders (
                        id BIGSERIAL PRIMARY KEY,
                        address VARCHAR(255),
                        name VARCHAR(255),
                        tel VARCHAR(255),
                        basket_id BIGINT,
                        total DOUBLE PRECISION,
                        CONSTRAINT FKkeq4ha3u9m7f5nv9wqyk4lnap FOREIGN KEY (basket_id) REFERENCES baskets (id)
);

CREATE TABLE tokens (
                        id BIGSERIAL PRIMARY KEY,
                        token VARCHAR(255),
                        users_id BIGINT,
                        CONSTRAINT tokens_id_uindex UNIQUE (id),
                        CONSTRAINT FKl50lok37qf2734u04knlj57ct FOREIGN KEY (users_id) REFERENCES users (id)
);