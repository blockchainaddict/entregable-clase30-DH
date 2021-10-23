CREATE TABLE `notes` (
   `id` INT NOT NULL PRIMARY KEY,
   `title` VARCHAR(100) NOT NULL,
   `date_created` DATE,
   `date_modified` DATE,
   `description` TEXT NOT NULL,
   `user_id` INT,
   `category_id` INT NOT NULL,
   `can_delete` TINYINT NOT NULL
);

CREATE TABLE `users` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(30) NOT NULL,
   `last_name` VARCHAR(60) NOT NULL,
   `email` VARCHAR(60) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `categories` (
   `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   `name` VARCHAR(30) NOT NULL
);


ALTER TABLE `notes` ADD CONSTRAINT `FK_8c219adf-db71-4036-bd31-1e74f08778e9` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `notes` ADD CONSTRAINT `FK_97c29ae9-3a7b-45f4-8676-d8ad8c28bf27` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`);