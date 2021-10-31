CREATE TABLE `notes` (
   `id` INT NOT NULL,
   `title` VARCHAR(100) NOT NULL,
   `date_created` DATE,
   `date_modified` DATE,
   `description` TEXT NOT NULL,
   `user_id` INT,
   `can_delete` TINYINT NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(30) NOT NULL,
   `last_name` VARCHAR(60) NOT NULL,
   `email` VARCHAR(60) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `note_categories` (
   `id` INT NOT NULL,
   `note_id` INT,
   `category_id` INT,
   PRIMARY KEY (`id`)
);

CREATE TABLE `categories` (
   `id` INT NOT NULL,
   `name` VARCHAR(30),
   PRIMARY KEY (`id`)
);


ALTER TABLE `notes` ADD CONSTRAINT `FK_8c219adf-db71-4036-bd31-1e74f08778e9` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)  ;

ALTER TABLE `note_categories` ADD CONSTRAINT `FK_259113b2-1c0c-4f29-9e01-c2019d63bbda` FOREIGN KEY (`note_id`) REFERENCES `notes`(`id`)  ;

ALTER TABLE `note_categories` ADD CONSTRAINT `FK_4822611f-cae1-499b-8d06-00198facd664` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)  ;



-- Create user entries

INSERT INTO users
VALUES (1, "john", "smart", "johnsmart@io");

INSERT INTO users
VALUES (2, "james", "drake", "jd@io");

INSERT INTO users
VALUES (3, "jack", "alton", "jacka@io");

INSERT INTO users
VALUES (4, "aaron", "tanner", "atanner@io");

INSERT INTO users
VALUES (5, "michael", "axelrod", "maxelrod@io");

INSERT INTO users
VALUES (6, "robert", "class", "rc@io");

INSERT INTO users
VALUES (7, "julia", "michaels", "jm@io");

INSERT INTO users
VALUES (8, "alissa", "michaels", "alissam@io");

INSERT INTO users
VALUES (9, "dina", "madani", "dinam@io");

INSERT INTO users
VALUES (10, "anna", "bist", "annabistm@io");

-- Create notes entries

INSERT INTO notes
VALUES (1, "note by John", "2021-01-01", "2021-01-01", "Just a note to test the app", 1, 0);

INSERT INTO notes
VALUES (2, "second note by john", "2021-01-02", "2021-02-02", "I like the app so far", 1, 1);

INSERT INTO notes
VALUES (3, "james drake's note", "2021-01-03", "2021-02-03", "I am james the poet", 2, 1);

INSERT INTO notes
VALUES (4, "music notes", "2021-04-05", "2021-04-06", "I love music", 3, 0);

INSERT INTO notes
VALUES (5, "romantic note", "2021-04-07", "2021-06-08", "My love diary", 5, 0);

-- Create categories entries

INSERT INTO categories
VALUES (1, "science fiction");

INSERT INTO categories
VALUES (2, "horror");

INSERT INTO categories
VALUES (3, "romance");

INSERT INTO categories
VALUES (4, "music");

INSERT INTO categories
VALUES (5, "poetry");

INSERT INTO categories
VALUES (6, "industrial");

INSERT INTO categories
VALUES (7, "cyber punk");

INSERT INTO categories
VALUES (8, "garage");

INSERT INTO categories
VALUES (9, "informative");

INSERT INTO categories
VALUES (10, "garbage");

-- Create note_categories entries

INSERT INTO note_categories
VALUES (1, 1, 1);

INSERT INTO note_categories
VALUES (2, 1, 3);

INSERT INTO note_categories
VALUES (3, 2, 2);

INSERT INTO note_categories
VALUES (4, 3, 4);

INSERT INTO note_categories
VALUES (5, 4, 5);

INSERT INTO note_categories
VALUES (6, 5, 9);

-- Query

SELECT categories.name, note_categories.note_id
FROM categories
INNER JOIN note_categories
	ON category_id = categories.id
INNER JOIN notes
	ON note_id = notes.id;

SELECT * FROM users;
