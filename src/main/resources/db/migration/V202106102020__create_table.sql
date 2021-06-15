CREATE TABLE `categories` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `name` varchar(45) NOT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `name` varchar(45) NOT NULL,
                         `email` varchar(45) NOT NULL,
                         `password` varchar(45) NOT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `name` varchar(45) NOT NULL,
                            `image` varchar(45) NOT NULL,
                            `quantity` int NOT NULL,
                            `description` varchar(4500) DEFAULT NULL,
                            `price` int NOT NULL,
                            `categoryId` int NOT NULL,
                            PRIMARY KEY (`id`)
#                             KEY `categoryId_idx` (`categoryId`),
#                             CONSTRAINT `categoryId` FOREIGN KEY (`categoryId`) REFERENCES `categories`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


#
# CREATE TABLE `shop`.`feedbacks` (
#                              `id` int NOT NULL AUTO_INCREMENT,
#                              `stars` int NOT NULL,
#                              `description` varchar(100) DEFAULT NULL,
#                              `userId` int DEFAULT NULL,
#                              `productId2` int DEFAULT NULL,
#                              PRIMARY KEY (`id`),
#                              KEY `productId_idx` (`productId2`),
#                              KEY `userId_idx` (`userId`),
#                              CONSTRAINT `productId2` FOREIGN KEY (`productId2`) REFERENCES `products` (`id`) ,
#                              CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
#
#
# CREATE TABLE `shop`.`orders` (
#                           `id` int NOT NULL AUTO_INCREMENT,
#                           `date` datetime(6) DEFAULT NULL,
#                           `productId` int DEFAULT NULL,
#                           `userId2` int DEFAULT NULL,
#                           PRIMARY KEY (`id`),
#                           KEY `userId_idx` (`userId2`),
#                           KEY `productId_idx` (`productId`),
#                           CONSTRAINT `productId` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ,
#                           CONSTRAINT `userId2` FOREIGN KEY (`userId2`) REFERENCES `users` (`id`)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci