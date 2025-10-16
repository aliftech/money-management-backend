-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    type ENUM('income', 'expense', 'transfer') NOT NULL,
    category_id INT NULL,
    note TEXT NULL,
    occured_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL
)