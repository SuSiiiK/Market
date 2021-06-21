create table categories
(
    id   integer      not null auto_increment,
    name varchar(255) not null,
    primary key (id)
) engine = InnoDB;

create table feedbacks
(
    id          integer      not null auto_increment,
    description varchar(255) not null,
    stars       integer      not null,
    product_id  integer,
    user_id     integer,
    primary key (id)
) engine = InnoDB;

create table orders
(
    id         integer not null auto_increment,
    product_id integer not null,
    user_id    integer not null,
    primary key (id)
) engine = InnoDB;

create table products
(
    id          integer      not null auto_increment,
    description varchar(255),
    image       varchar(255) not null,
    name        varchar(255) not null,
    price       integer      not null,
    quantity    integer      not null,
    category_id integer      not null,
    primary key (id)
) engine = InnoDB;

CREATE TABLE `users` (
                             `id` int auto_increment NOT NULL,
                             `email` varchar(128) NOT NULL,
                             `password` varchar(128) NOT NULL,
                             `fullname` varchar(128) NOT NULL default ' ',
                             `enabled` boolean NOT NULL default true,
                             `role` varchar(16) NOT NULL default 'USER',
                             PRIMARY KEY (`id`),
                             UNIQUE INDEX `email_unique` (`email` ASC)
);


alter table feedbacks
    add constraint FKti2ywtwc29ys1i591rmmaveyc foreign key (product_id) references products (id);
alter table feedbacks
    add constraint FK312drfl5lquu37mu4trk8jkwx foreign key (user_id) references users (id);
alter table orders
    add constraint FKkp5k52qtiygd8jkag4hayd0qg foreign key (product_id) references products (id);
alter table orders
    add constraint FK32ql8ubntj5uh44ph9659tiih foreign key (user_id) references users (id);
alter table products
    add constraint FKog2rp4qthbtt2lfyhfo32lsw9 foreign key (category_id) references categories (id);