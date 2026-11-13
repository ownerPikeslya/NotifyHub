import 'package:uni_tests/channels/channel.dart';
import 'package:uni_tests/channels/email_channel.dart';
import 'package:uni_tests/channels/legacy_sms_gateway.dart';
import 'package:uni_tests/channels/push_channel.dart';
import 'package:uni_tests/channels/sms_adapter.dart';
// import 'package:uni_tests/decorators/channel_decorator.dart';
import 'package:uni_tests/decorators/encryption_decorator.dart';
import 'package:uni_tests/decorators/stamp_decorator.dart';
import 'package:uni_tests/decorators/time_decorator.dart';
import 'package:uni_tests/decorators/urgent_decorator.dart';
import 'package:uni_tests/factories/eng_template_factory.dart';
import 'package:uni_tests/factories/ru_template_factory.dart';
import 'package:uni_tests/factories/template_factory.dart';
import 'package:uni_tests/factories/uz_template_factory.dart';
import 'package:uni_tests/models/message.dart';
import 'package:uni_tests/models/recipient.dart';
import 'package:uni_tests/notifications/advertising_notification.dart';
// import 'package:uni_tests/notifications/notification.dart';
import 'package:uni_tests/notifications/simple_notification.dart';
import 'package:uni_tests/notifications/urgent_notification.dart';
// import '../lib/notifications/simple_notification.dart';

void main(){
  EmailChannel emailChannel = EmailChannel();
  PushChannel pushChannel = PushChannel();
  SmsAdapter smsAdapter = SmsAdapter(LegacySmsGateway());
  UrgentNotification urgentNotificationSms = UrgentNotification(smsAdapter);
  SimpleNotification simpleNotificationSms = SimpleNotification(smsAdapter);
  AdvertisingNotification advertisingNotificationSms = AdvertisingNotification(smsAdapter);
  UrgentNotification urgentNotificationEmail = UrgentNotification(emailChannel);
  SimpleNotification simpleNotificationEmail = SimpleNotification(emailChannel);
  AdvertisingNotification advertisingNotificationEmail = AdvertisingNotification(emailChannel);
  // UrgentDecorator urgentDecorator = UrgentDecorator(emailChannel);
  // TimeDecorator timeDecorator = TimeDecorator(emailChannel);
  // StampDecorator stampDecorator = StampDecorator(emailChannel);
  // EncryptionDecorator encryptionDecorator = EncryptionDecorator(emailChannel);

  Recipient recipient = Recipient("mike", "smth@gmail.com","+998777777777");
  Message simpleMessage = Message("Сообщение", "только сегодня");
  Message urgentMessage = Message("БОЛЬШИЕ СКИДКИ", "приди за скидками");
  Message advertisingMessage = Message("Скидка на товар", "Наш продукт самый лучший");

  print("SMS:");
  urgentNotificationSms.notify(recipient, urgentMessage);
  simpleNotificationSms.notify(recipient, simpleMessage);
  advertisingNotificationSms.notify(recipient, advertisingMessage);

  print("EMAIL:");
  urgentNotificationEmail.notify(recipient, urgentMessage);
  simpleNotificationEmail.notify(recipient, simpleMessage);
  advertisingNotificationEmail.notify(recipient, advertisingMessage);
  // urgentNotificationEmail
  print("--------------------------------------------------------");
  smsAdapter.send(recipient, "helloooo");
  emailChannel.send(recipient, "hello");
  pushChannel.send(recipient, "hi");


  // TimeDecorator(EmailChannel()).send(recipient, "time");
  // UrgentDecorator(TimeDecorator(EmailChannel())).send(recipient, "urgent");
  // StampDecorator(UrgentDecorator(TimeDecorator(EmailChannel()))).send(recipient, "stamp");
  // EncryptionDecorator(StampDecorator(UrgentDecorator(TimeDecorator(EmailChannel())))).send(recipient, "encryption");

  Channel time = TimeDecorator(emailChannel);
  Channel urgent = UrgentDecorator(time);
  Channel stamp = StampDecorator(urgent);
  Channel encrypted = EncryptionDecorator(stamp);

  time.send(recipient, "привет");
  urgent.send(recipient, "привет");
  stamp.send(recipient, "привет");
  encrypted.send(recipient, "привет");

  TemplateFactory ruFactory = RuTemplateFactory();
  TemplateFactory uzFactory = UzTemplateFactory();
  TemplateFactory engFactory = EngTemplateFactory();

  simpleNotificationEmail.notify(recipient, ruFactory.greeting());
  simpleNotificationEmail.notify(recipient, ruFactory.discount());
  simpleNotificationEmail.notify(recipient, ruFactory.reminder());

  simpleNotificationEmail.notify(recipient, uzFactory.greeting());
  simpleNotificationEmail.notify(recipient, uzFactory.discount());
  simpleNotificationEmail.notify(recipient, uzFactory.reminder());

  simpleNotificationEmail.notify(recipient, engFactory.greeting());
  simpleNotificationEmail.notify(recipient, engFactory.discount());
  simpleNotificationEmail.notify(recipient, engFactory.reminder());
}