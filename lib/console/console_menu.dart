import 'dart:io';

import 'package:uni_tests/channels/channel.dart';
import 'package:uni_tests/notifications/advertising_notification.dart';

import '../channels/email_channel.dart';
import '../channels/legacy_sms_gateway.dart';
import '../channels/push_channel.dart';
import '../channels/sms_adapter.dart';
import '../decorators/encryption_decorator.dart';
import '../decorators/stamp_decorator.dart';
import '../decorators/time_decorator.dart';
import '../decorators/urgent_decorator.dart';
import '../factories/eng_template_factory.dart';
import '../factories/ru_template_factory.dart';
import '../factories/template_factory.dart';
import '../factories/uz_template_factory.dart';
import '../history/notification_history.dart';
import '../models/message.dart';
import '../models/recipient.dart';
import '../notifications/notification.dart';
import '../notifications/simple_notification.dart';
import '../notifications/urgent_notification.dart';

class ConsoleMenu {
  Recipient recipient = Recipient("mike", "smth@gmail.com", "+998777777777");

  void run() {
    while (true) {
      print('1 - Отправить уведомление');
      print('2 - Показать историю');
      print('0 - Выход');
      stdout.write('Введите команду: ');
      String? input = stdin.readLineSync();

      if (input == '1') {
        //Канал
        print('Канал: 1 - Email');
        print('Канал: 2 - Push');
        print('Канал: 3 - SMS');
        stdout.write('Введите команду: ');
        String? chn = stdin.readLineSync();

        Channel channel;
        if (chn == '1') {
          channel = EmailChannel();
        } else if (chn == '2') {
          channel = PushChannel();
        } else if (chn == '3') {
          channel = SmsAdapter(LegacySmsGateway());
        } else {
          print('Неверный канал');
          continue;
        }

        //Декораторы
        stdout.write('Добавить время? (y/n): ');
        if (stdin.readLineSync() == 'y') {
          channel = TimeDecorator(channel);
        }
        stdout.write('Добавить подпись? (y/n): ');
        if (stdin.readLineSync() == 'y') {
          channel = StampDecorator(channel);
        }
        stdout.write('Пометить срочным? (y/n): ');
        if (stdin.readLineSync() == 'y') {
          channel = UrgentDecorator(channel);
        }
        stdout.write('Зашифровать? (y/n): ');
        if (stdin.readLineSync() == 'y') {
          channel = EncryptionDecorator(channel);
        }

        // Сообщение
        print('1 - Шаблон');
        print('2 - Свой текст');
        stdout.write('Введите команду: ');
        String? msgType = stdin.readLineSync();

        Message message;
        if (msgType == '1') {
          print('Язык: 1 - Русский');
          print('Язык: 2 - Узбекский');
          print('Язык: 3 - Английский');
          stdout.write('Введите команду: ');
          String? lang = stdin.readLineSync();

          TemplateFactory factory;
          if (lang == '1') {
            factory = RuTemplateFactory();
          } else if (lang == '2') {
            factory = UzTemplateFactory();
          } else if (lang == '3') {
            factory = EngTemplateFactory();
          } else {
            print('Неверный язык');
            continue;
          }

          print('1 - Приветствие');
          print('2 - Скидка');
          print('3 - Напоминание');
          stdout.write('Введите команду: ');
          String? tpl = stdin.readLineSync();

          if (tpl == '1') {
            message = factory.greeting();
          } else if (tpl == '2') {
            message = factory.discount();
          } else if (tpl == '3') {
            message = factory.reminder();
          } else {
            print('Неверный шаблон');
            continue;
          }
        } else if (msgType == '2') {
          stdout.write('Текст: ');
          String text = stdin.readLineSync() ?? '';
          message = Message('Сообщение', text);
        } else {
          print('Неверная команда');
          continue;
        }

        //Тип уведомления
        print('1 - Обычное');
        print('2 - Срочное');
        print('3 - Рекламное');
        stdout.write('Введите команду: ');
        String? type = stdin.readLineSync();

        Notification n;
        if (type == '1') {
          n = SimpleNotification(channel);
        } else if (type == '2') {
          n = UrgentNotification(channel);
        } else if (type == '3') {
          n = AdvertisingNotification(channel);
        } else {
          print('Неверная команда');
          continue;
        }

        n.notify(recipient, message);
      } else if (input == '2') {
        NotificationHistory().showAll();
      } else if (input == '0') {
        break;
      } else {
        print('Неверная команда');
      }
    }
  }
}
