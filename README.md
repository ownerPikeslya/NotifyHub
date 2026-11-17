# NotifyHub

Консольное приложение на Dart, которое имитирует сервис уведомлений.
Лабораторная работа №1 по паттернам проектирования.

## Запуск

```
dart pub get
dart run bin/main.dart
```

## Как пользоваться

Главное меню:
- `1`: отправить уведомление
- `2`: показать историю
- `0`: выход

При отправке нужно по очереди выбрать:
1. Канал: Email, Push или SMS.
2. Декораторы (y/n): время, подпись, «Срочно», шифрование.
3. Сообщение: шаблон (язык Ru / Uz / Eng; приветствие, скидка или напоминание) или свой текст.
4. Тип уведомления: обычное, срочное или рекламное.

## Паттерны

| Паттерн | Где | Что делает |
|---|---|---|
| **Bridge** | `lib/notifications/`, `lib/channels/` | Тип уведомления (`Notification`) отделён от канала отправки (`Channel`), поэтому любой тип можно отправить через любой канал. |
| **Adapter** | `lib/channels/sms_adapter.dart` | `SmsAdapter` приводит старый `LegacySmsGateway` к интерфейсу `Channel`, не меняя сам шлюз. |
| **Decorator** | `lib/decorators/` | `Time`, `Stamp`, `Urgent`, `Encryption` оборачивают канал и меняют текст перед отправкой. Их можно комбинировать. |
| **Abstract Factory** | `lib/factories/` | `TemplateFactory` создаёт шаблоны сообщений (приветствие, скидка, напоминание), а `Ru`, `Uz` и `Eng` дают их на своём языке. |
| **Singleton** | `lib/history/notification_history.dart` | `NotificationHistory` существует в одном экземпляре и хранит историю всех отправленных уведомлений. |

## Структура

```
bin/main.dart              точка входа
lib/models/                Recipient, Message
lib/channels/              Channel, Email, Push, LegacySmsGateway, SmsAdapter
lib/notifications/         Notification, Simple, Urgent, Advertising
lib/decorators/            ChannelDecorator и декораторы
lib/factories/             TemplateFactory и фабрики Ru / Uz / Eng
lib/history/               NotificationHistory
lib/console/               ConsoleMenu
```
