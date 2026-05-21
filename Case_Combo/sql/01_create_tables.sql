DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS combo_orders CASCADE;
DROP TABLE IF EXISTS combo_offers CASCADE;
DROP TABLE IF EXISTS taxi_orders CASCADE;
DROP TABLE IF EXISTS delivery_orders CASCADE;
DROP TABLE IF EXISTS addresses CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    phone VARCHAR(30) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    address_text TEXT NOT NULL,
    city VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE delivery_orders (
    delivery_order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    delivery_address TEXT NOT NULL,
    status VARCHAR(30) NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE taxi_orders (
    taxi_order_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(user_id),
    pickup_address TEXT NOT NULL,
    destination_address TEXT NOT NULL,
    status VARCHAR(30) NOT NULL,
    estimated_price NUMERIC(10, 2),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE combo_offers (
    combo_offer_id SERIAL PRIMARY KEY,
    delivery_order_id INT NOT NULL UNIQUE REFERENCES delivery_orders(delivery_order_id),
    status VARCHAR(30) NOT NULL,
    estimated_taxi_price NUMERIC(10, 2),
    suggested_pickup_time TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE combo_orders (
    combo_order_id SERIAL PRIMARY KEY,
    delivery_order_id INT NOT NULL UNIQUE REFERENCES delivery_orders(delivery_order_id),
    taxi_order_id INT UNIQUE REFERENCES taxi_orders(taxi_order_id),
    status VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    delivery_order_id INT REFERENCES delivery_orders(delivery_order_id),
    taxi_order_id INT REFERENCES taxi_orders(taxi_order_id),
    amount NUMERIC(10, 2) NOT NULL,
    status VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),

    CONSTRAINT payment_has_one_order_reference
    CHECK (
        (delivery_order_id IS NOT NULL AND taxi_order_id IS NULL)
        OR
        (delivery_order_id IS NULL AND taxi_order_id IS NOT NULL)
    )
);