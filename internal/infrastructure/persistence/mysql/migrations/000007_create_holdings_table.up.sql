-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE holdings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    portfolio_id INT NOT NULL,
    asset_id INT NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    quantity DECIMAL(20,8) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    acquired_at DATETIME NOT NULL,
    average_price DECIMAL(20,8) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL
)