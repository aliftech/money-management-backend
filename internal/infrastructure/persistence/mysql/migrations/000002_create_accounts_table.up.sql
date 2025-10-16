-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    type enum('cash', 'bank', 'credit', 'e-wallet') NOT NULL,
    currency VARCHAR(3) NOT NULL,
    balance DECIMAL(20, 2) NOT NULL DEFAULT 0.00,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL
)