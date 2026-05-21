# Кейс 2. Combo Order System

Кейс описывает сценарий, при котором пользователь после оформления заказа еды получает предложение вызвать такси. При принятии предложения система создаёт связанный combo-сценарий между DeliveryOrder и TaxiOrder.

## Что сделано

- описана бизнес-логика combo-сценария;
- подготовлена BPMN/flow-схема процесса;
- спроектирована ERD модели данных;
- описаны бизнес- и функциональные требования;
- подготовлены User Stories и Acceptance Criteria;
- описана статусная модель;
- подготовлены SQL-файлы PostgreSQL.

## Основные сущности

- User
- Address
- DeliveryOrder
- TaxiOrder
- ComboOffer
- ComboOrder

## Артефакты

- `diagrams/bpmn combo.drawio`
- `diagrams/bpmn combo.png`
- `diagrams/combo_erd.drawio`
- `diagrams/erd combo.png`
- `docs/project_overview.md`
- `docs/requirements.md`
- `docs/user_stories.md`
- `docs/acceptance_criteria.md`
- `docs/status_model.md`
- `docs/data_model.md`
- `sql/01_create_tables.sql`
- `sql/02_insert_test_data.sql`
- `sql/03_select_examples.sql`