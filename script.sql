Create database epicerie ;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);


CREATE TABLE Client (
    id INT  AUTO_INCREMENT PRIMARY KEY,
    user_id INT ,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);


CREATE TABLE Admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT ,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE Category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE Product (
    
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    quantite INT ,           
    image VARCHAR(255)
    category_id INT ,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);



CREATE TABLE Cart (
    id  INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (client_id) REFERENCES Client(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE
);
CREATE TABLE `Order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    totalAmount DECIMAL(10, 2),
    status ENUM('0', '1') DEFAULT '0',
    cart_id INT ,
    FOREIGN KEY (cart_id) REFERENCES Cart(id) ON DELETE CASCADE
);
ALTER TABLE `Order` MODIFY COLUMN status ENUM('pending', 'completed') NOT NULL;

INSERT INTO `category` ( name) VALUES
('Produits Surgelés'),
( 'Fruits et Légumes'),
( 'Boissons'),
( 'Viandes et Poissons'),
( 'Hygiène et Beauté'),
( 'Animaux');

INSERT INTO `client` (`user_id`) VALUES
(2);
INSERT INTO `product` ( `name`, `description`, `price`, `quantite`, `image`, `category_id`) VALUES
( 'Épinards Surgelés', 'Épinards surgelés prêts à l\'emploi, riches en vitamines.', 2.99, 100, 'epinards_surgeles.jpg', 1),
( 'Jus d\'Orange', 'Jus d\'orange frais sans sucre ajouté.', 3.49, 200, 'jus_orange.jpg', 2),
( 'Pommes', 'Pommes fraîches et croquantes, idéales pour une collation saine.', 1.99, 150, 'pommes.jpg', 1),
( 'Fromage Cheddar', 'Fromage cheddar vieilli, parfait pour les sandwiches et les collations.', 4.99, 80, 'fromage_cheddar.jpg', 1),
('Saumon Frais', 'Filet de saumon frais, riche en oméga-3.', 12.99, 50, 'saumon_frais.jpg', 1),
( 'Croissant', 'Croissant frais et croustillant, idéal pour le petit déjeuner.', 1.49, 300, 'croissant.jpg', 2),
( 'Pâtes Spaghetti', 'Pâtes spaghetti de qualité supérieure, parfaites pour les repas en famille.', 1.99, 500, 'pates_spaghetti.jpg', 4),
( 'Tablette de Chocolat', 'Tablette de chocolat noir à 70% de cacao, intense et savoureuse.', 2.49, 250, 'chocolat_noir.jpg', 3);

INSERT INTO `users` ( `email`, `password`, `name`) VALUES
( 'jean.dupont@example.com', 'password123', 'sophie'),
( 'marie.martin@example.com', 'securepass456', 'marie'),
( 'admin@example.com', 'adminpassword', 'admin'),
( 'pierre.durand@example.com', 'mypassword789', 'sophie'),
( 'sophie.bernard@example.com', 'sophiepass', NULL);

INSERT INTO `order` ( `totalAmount`, `status`, `cart_id`) VALUES
( 151.00, 'pending', 7);
