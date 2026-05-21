INSERT INTO users (full_name, phone)
VALUES
    ('Иван Петров', '+79990000001'),
    ('Анна Смирнова', '+79990000002');

INSERT INTO addresses (user_id, address_text, city)
VALUES
    (1, 'Москва, ул. Тверская, 10', 'Москва'),
    (1, 'Москва, ул. Арбат, 15', 'Москва'),
    (2, 'Москва, Ленинский проспект, 20', 'Москва');

INSERT INTO delivery_orders (user_id, delivery_address, status, total_amount)
VALUES
    (1, 'Москва, ул. Тверская, 10', 'created', 1250.00),
    (1, 'Москва, ул. Арбат, 15', 'paid', 980.00),
    (2, 'Москва, Ленинский проспект, 20', 'created', 1450.00);

INSERT INTO taxi_orders (user_id, pickup_address, destination_address, status, estimated_price)
VALUES
    (1, 'Москва, ул. Тверская, 10', 'Москва, Павелецкий вокзал', 'created', 620.00),
    (2, 'Москва, Ленинский проспект, 20', 'Москва, Курский вокзал', 'failed', 750.00);

INSERT INTO combo_offers (
    delivery_order_id,
    status,
    estimated_taxi_price,
    suggested_pickup_time,
    expires_at
)
VALUES
    (1, 'accepted', 620.00, NOW() + INTERVAL '30 minutes', NOW() + INTERVAL '10 minutes'),
    (2, 'declined', 540.00, NOW() + INTERVAL '25 minutes', NOW() + INTERVAL '5 minutes'),
    (3, 'expired', 750.00, NOW() + INTERVAL '20 minutes', NOW() - INTERVAL '1 minute');

INSERT INTO combo_orders (
    delivery_order_id,
    taxi_order_id,
    status
)
VALUES
    (1, 1, 'created'),
    (3, 2, 'failed');

INSERT INTO payments (delivery_order_id, taxi_order_id, amount, status)
VALUES
    (1, NULL, 1250.00, 'paid'),
    (2, NULL, 980.00, 'paid'),
    (NULL, 1, 620.00, 'created');