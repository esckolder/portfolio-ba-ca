# Модель данных Combo Order System

## Сущности

### User

Хранит данные пользователя.

Поля:

- `user_id`
- `full_name`
- `phone`
- `created_at`

### Address

Хранит адреса пользователя.

Поля:

- `address_id`
- `user_id`
- `address_text`
- `city`
- `created_at`

### DeliveryOrder

Хранит заказ еды.

Поля:

- `delivery_order_id`
- `user_id`
- `delivery_address`
- `status`
- `total_amount`
- `created_at`

### TaxiOrder

Хранит заказ такси.

Поля:

- `taxi_order_id`
- `user_id`
- `pickup_address`
- `destination_address`
- `status`
- `estimated_price`
- `created_at`

### ComboOffer

Хранит предложение такси после заказа еды.

Поля:

- `combo_offer_id`
- `delivery_order_id`
- `status`
- `estimated_taxi_price`
- `suggested_pickup_time`
- `expires_at`
- `created_at`

### ComboOrder

Хранит связь между заказом еды и заказом такси.

Поля:

- `combo_order_id`
- `delivery_order_id`
- `taxi_order_id`
- `status`
- `created_at`

## Связи

`User 1 → N Address`

Один пользователь может иметь несколько адресов.

`User 1 → N DeliveryOrder`

Один пользователь может иметь несколько заказов еды.

`User 1 → N TaxiOrder`

Один пользователь может иметь несколько заказов такси.

`DeliveryOrder 1 → 0..1 ComboOffer`

Не каждый заказ еды получает combo-предложение.

`DeliveryOrder 1 → 0..1 ComboOrder`

Combo-сценарий создаётся только после принятия предложения.

`TaxiOrder 1 → 0..1 ComboOrder`

Заказ такси может быть связан с одним combo-сценарием.

## Примечание по Payment

Полная платежная инфраструктура не входит в текущий scope проекта. При необходимости сущность Payment может быть вынесена в расширенную версию модели данных.