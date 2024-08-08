
# use db
# use demo_intern;

# Create categories table
CREATE TABLE categories
(
    id         int AUTO_INCREMENT PRIMARY KEY,
    name       varchar(100) NOT NULL,
    created_at timestamp default CURRENT_TIMESTAMP,
    updated_at timestamp default CURRENT_TIMESTAMP
);

# Brands
CREATE TABLE brands
(
    id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL,
    created_at  timestamp default CURRENT_TIMESTAMP,
    updated_at  timestamp default CURRENT_TIMESTAMP
);

# Create products table
CREATE TABLE products
(
    id          int AUTO_INCREMENT PRIMARY KEY,
    category_id int,
    brand_id    int,
    name        varchar(100) NOT NULL,
    price       decimal(12, 2) NOT NULL DEFAULT 0,
    created_at  timestamp default CURRENT_TIMESTAMP,
    updated_at  timestamp default CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) references categories (id) on delete SET NULL,
    FOREIGN KEY (brand_id) references brands(id) on delete SET NULL
);

# Create transactions table
CREATE TABLE transactions
(
    id           int AUTO_INCREMENT PRIMARY KEY,
    product_id   int,
    product_name varchar(100),
    price        decimal(12, 2),
    qty          int,
    total        int,
    created_at   timestamp default CURRENT_TIMESTAMP,
    updated_at   timestamp default CURRENT_TIMESTAMP
);

# insert brands
INSERT INTO brands (name)
VALUES ('Panasinoc'),
       ('Syno'),
       ('SunFruit');

# insert categories
INSERT INTO categories (name)
VALUES ('Fruit'),
       ('Cooking'),
       ('Electronic');

# insert products
INSERT INTO products (name, category_id, brand_id)
VALUES ('Apple', 1, 3),
       ('TV', 3, 2),
       ('Electric Pan', 2, 2),
       ('Microwave', 2, 2),
       ('Radio', 3, 1);

INSERT INTO transactions (product_id, product_name, price, qty, total, created_at, updated_at)
VALUES
-- Transactions for Apple
(1, 'Apple', 1000, 2, 2000, '2024-01-01', '2024-01-01'),
(1, 'Apple', 1000, 5, 5000, '2024-01-15', '2024-01-15'),
(1, 'Apple', 1000, 10, 10000, '2024-01-30', '2024-01-30'),

(1, 'Apple', 1000, 3, 3000, '2024-02-05', '2024-02-05'),
(1, 'Apple', 1000, 7, 7000, '2024-02-15', '2024-02-15'),
(1, 'Apple', 1000, 6, 6000, '2024-02-25', '2024-02-25'),

(1, 'Apple', 1000, 4, 4000, '2024-03-02', '2024-03-02'),
(1, 'Apple', 1000, 8, 8000, '2024-03-12', '2024-03-12'),
(1, 'Apple', 1000, 12, 12000, '2024-03-20', '2024-03-20'),

-- Transactions for TV
(2, 'TV', 3000, 1, 3000, '2023-12-05', '2023-12-05'),
(2, 'TV', 3000, 2, 6000, '2023-12-15', '2023-12-15'),
(2, 'TV', 3000, 1, 3000, '2023-12-25', '2023-12-25'),

(2, 'TV', 3000, 1, 3000, '2024-01-05', '2024-01-05'),
(2, 'TV', 3000, 2, 6000, '2024-01-15', '2024-01-15'),
(2, 'TV', 3000, 1, 3000, '2024-01-25', '2024-01-25'),

(2, 'TV', 3000, 3, 9000, '2024-02-03', '2024-02-03'),
(2, 'TV', 3000, 1, 3000, '2024-02-14', '2024-02-14'),
(2, 'TV', 3000, 4, 12000, '2024-02-22', '2024-02-22'),

(2, 'TV', 3000, 2, 6000, '2024-03-01', '2024-03-01'),
(2, 'TV', 3000, 3, 9000, '2024-03-10', '2024-03-10'),
(2, 'TV', 3000, 1, 3000, '2024-03-20', '2024-03-20'),

-- Transactions for Electric Pan
(3, 'Electric Pan', 5000, 1, 5000, '2024-01-02', '2024-01-02'),
(3, 'Electric Pan', 5000, 2, 10000, '2024-01-15', '2024-01-15'),
(3, 'Electric Pan', 5000, 3, 15000, '2024-01-28', '2024-01-28'),

(3, 'Electric Pan', 5000, 4, 20000, '2024-02-05', '2024-02-05'),
(3, 'Electric Pan', 5000, 1, 5000, '2024-02-15', '2024-02-15'),
(3, 'Electric Pan', 5000, 2, 10000, '2024-02-25', '2024-02-25'),

(3, 'Electric Pan', 5000, 2, 10000, '2024-03-03', '2024-03-03'),
(3, 'Electric Pan', 5000, 5, 25000, '2024-03-12', '2024-03-12'),
(3, 'Electric Pan', 5000, 1, 5000, '2024-03-20', '2024-03-20'),

-- Transactions for Microwave
(4, 'Microwave', 2000, 1, 2000, '2024-01-10', '2024-01-10'),
(4, 'Microwave', 2000, 2, 4000, '2024-01-20', '2024-01-20'),
(4, 'Microwave', 2000, 3, 6000, '2024-01-30', '2024-01-30'),

(4, 'Microwave', 2000, 2, 4000, '2024-02-05', '2024-02-05'),
(4, 'Microwave', 2000, 1, 2000, '2024-02-15', '2024-02-15'),
(4, 'Microwave', 2000, 4, 8000, '2024-02-25', '2024-02-25'),

(4, 'Microwave', 2000, 3, 6000, '2024-03-02', '2024-03-02'),
(4, 'Microwave', 2000, 2, 4000, '2024-03-10', '2024-03-10'),
(4, 'Microwave', 2000, 1, 2000, '2024-03-20', '2024-03-20'),

-- Transactions for Radio
(5, 'Radio', 1500, 2, 3000, '2024-01-03', '2024-01-03'),
(5, 'Radio', 1500, 1, 1500, '2024-01-15', '2024-01-15'),
(5, 'Radio', 1500, 3, 4500, '2024-01-28', '2024-01-28'),

(5, 'Radio', 1500, 4, 6000, '2024-02-01', '2024-02-01'),
(5, 'Radio', 1500, 2, 3000, '2024-02-12', '2024-02-12'),
(5, 'Radio', 1500, 1, 1500, '2024-02-22', '2024-02-22'),

(5, 'Radio', 1500, 3, 4500, '2024-03-05', '2024-03-05'),
(5, 'Radio', 1500, 2, 3000, '2024-03-15', '2024-03-15'),
(5, 'Radio', 1500, 4, 6000, '2024-03-25', '2024-03-25');
