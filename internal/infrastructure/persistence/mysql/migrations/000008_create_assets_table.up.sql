-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE assets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    assets_type ENUM('stock', 'fund', 'crypto', 'commodity', 'property', 'cash') NOT NULL,
    marketplace VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL
)