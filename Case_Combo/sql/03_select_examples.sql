 1. Получить combo-сценарии со статусами заказов еды и такси

SELECT
    co.combo_order_id,
    do.delivery_order_id,
    do.status AS delivery_status,
    to2.taxi_order_id,
    to2.status AS taxi_status,
    co.status AS combo_status
FROM combo_orders co
JOIN delivery_orders do
    ON co.delivery_order_id = do.delivery_order_id
LEFT JOIN taxi_orders to2
    ON co.taxi_order_id = to2.taxi_order_id
ORDER BY co.combo_order_id;


 2. Найти активные combo-предложения

SELECT
    combo_offer_id,
    delivery_order_id,
    status,
    estimated_taxi_price,
    suggested_pickup_time,
    expires_at
FROM combo_offers
WHERE status IN ('created', 'shown')
  AND expires_at > NOW()
ORDER BY expires_at;


 3. Найти истёкшие combo-предложения

SELECT
    combo_offer_id,
    delivery_order_id,
    status,
    expires_at
FROM combo_offers
WHERE expires_at <= NOW()
  AND status IN ('created', 'shown', 'expired')
ORDER BY expires_at;


 4. Найти заказы еды без созданного combo-сценария

SELECT
    do.delivery_order_id,
    do.user_id,
    do.status,
    do.created_at
FROM delivery_orders do
LEFT JOIN combo_orders co
    ON do.delivery_order_id = co.delivery_order_id
WHERE co.combo_order_id IS NULL
ORDER BY do.delivery_order_id;


 5. Получить combo-предложения вместе с данными пользователя

SELECT
    cf.combo_offer_id,
    cf.status AS combo_offer_status,
    cf.estimated_taxi_price,
    cf.expires_at,
    do.delivery_order_id,
    do.delivery_address,
    u.user_id,
    u.full_name,
    u.phone
FROM combo_offers cf
JOIN delivery_orders do
    ON cf.delivery_order_id = do.delivery_order_id
JOIN users u
    ON do.user_id = u.user_id
ORDER BY cf.combo_offer_id;


 6. Получить платежи по заказам еды

SELECT
    p.payment_id,
    p.amount,
    p.status AS payment_status,
    do.delivery_order_id,
    do.status AS delivery_status
FROM payments p
JOIN delivery_orders do
    ON p.delivery_order_id = do.delivery_order_id
ORDER BY p.payment_id;


 7. Получить платежи по заказам такси

SELECT
    p.payment_id,
    p.amount,
    p.status AS payment_status,
    to2.taxi_order_id,
    to2.status AS taxi_status
FROM payments p
JOIN taxi_orders to2
    ON p.taxi_order_id = to2.taxi_order_id
ORDER BY p.payment_id;