create table categories
(
    id   bigint auto_increment
        primary key,
    name varchar(255) null
) ;


CREATE TABLE `users` (
                         id        bigint not null auto_increment unique
                             primary key,
                         email     varchar(255) null,
                         enabled   bit          null,
                         password  varchar(255) null,
                         role      varchar(128) null,
                         user_name varchar(255) null
);




create table products
(
    id           bigint auto_increment
        primary key ,
    description varchar(255),
    image       varchar(255) not null,
    name        varchar(255) not null,
    price       double      not null,
    quantity    integer      not null,
    category_id bigint      not null,
    constraint FKteg3f0l6cndtbn3nsbr1tmxcl
        foreign key (category_id) references categories (id)
);


create table reviews
(
    id      bigint       not null  auto_increment unique primary key ,
    date    date         null,
    name    varchar(255) null,
    product_id bigint       null,
    user_id bigint       null,
    constraint FK81nkg9op14w8c6hw7f25f029i
        foreign key (product_id) references products (id),
    constraint FKcgy7qjc1r99dp117y9en6lxye
        foreign key (user_id) references users (id)

);



create table baskets
(
    id      bigint       not null auto_increment
        primary key,
    session varchar(255) null,
    user_id bigint       null,
    constraint FK87s17cinc4wkx0taas5nh0s8h
        foreign key (user_id) references users (id)

);


create table basket_products
(
    id        bigint not null  auto_increment
        primary key,
    qty       int    null,
    basket_id bigint null,
    product_id   bigint null,
    constraint FKlomoboid5pugq7ajp2kvqe5id
        foreign key (basket_id) references baskets (id),
    constraint FKs86tjrwd3ex57i294fpntxuc6
        foreign key (product_id) references products (id)

);

create table orders
(
    id        bigint auto_increment primary key ,
    address   varchar(255) null,
    name      varchar(255) null,
    tel       varchar(255) null,
    basket_id bigint       null,
    total     double       null,
    constraint FKkeq4ha3u9m7f5nv9wqyk4lnap
        foreign key (basket_id) references baskets (id)
);


create table tokens
(
    id       bigint auto_increment,
    token    varchar(255) null,
    users_id bigint       null,
    constraint tokens_id_uindex
        unique (id),
    constraint FKl50lok37qf2734u04knlj57ct
        foreign key (users_id) references users (id)

);

# alter table basket_products add constraint FKlomoboid5pugq7ajp2kvqe5id foreign key (basket_id) references baskets (id);
# alter table basket_products add constraint FKco87gmll53y8fpmmhli974xag foreign key (product_id) references products (id);
# alter table baskets add constraint FK87s17cinc4wkx0taas5nh0s8h foreign key (user_id) references users (id);
# alter table orders add constraint FKkeq4ha3u9m7f5nv9wqyk4lnap foreign key (basket_id) references baskets (id);
# alter table products add constraint FKog2rp4qthbtt2lfyhfo32lsw9 foreign key (category_id) references categories (id);
# alter table reviews add constraint FKpl51cejpw4gy5swfar8br9ngi foreign key (product_id) references products (id);
# alter table reviews add constraint FKcgy7qjc1r99dp117y9en6lxye foreign key (user_id) references users (id);
# alter table tokens add constraint FKl50lok37qf2734u04knlj57ct foreign key (users_id) references users (id);