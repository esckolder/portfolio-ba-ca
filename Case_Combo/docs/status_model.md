# Статусная модель

## DeliveryOrder

- `created` — заказ еды создан.
- `paid` — заказ еды оплачен.
- `completed` — заказ еды завершён.
- `canceled` — заказ еды отменён.
- `failed` — ошибка обработки заказа еды.

## TaxiOrder

- `created` — заказ такси создан.
- `searching_driver` — система ищет водителя.
- `accepted` — водитель принял заказ.
- `completed` — поездка завершена.
- `canceled` — заказ такси отменён.
- `failed` — ошибка заказа такси.

## ComboOffer

- `created` — combo-предложение создано.
- `shown` — предложение показано пользователю.
- `accepted` — пользователь принял предложение.
- `declined` — пользователь отклонил предложение.
- `expired` — срок действия предложения истёк.

## ComboOrder

- `created` — combo-сценарий создан.
- `taxi_created` — заказ такси создан и связан с заказом еды.
- `in_progress` — связанный сценарий выполняется.
- `completed` — combo-сценарий успешно завершён.
- `canceled` — combo-сценарий отменён.
- `failed` — combo-сценарий завершился ошибкой.

## Основные переходы

### ComboOffer

`created → shown → accepted`

`created → shown → declined`

`created → shown → expired`

### ComboOrder

`created → taxi_created → in_progress → completed`

`created → failed`

`created → canceled`