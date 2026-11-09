import 'package:uni_tests/channels/channel.dart';
import 'package:uni_tests/channels/email_channel.dart';
import 'package:uni_tests/channels/legacy_sms_gateway.dart';
import 'package:uni_tests/channels/push_channel.dart';
import 'package:uni_tests/channels/sms_adapter.dart';
import 'package:uni_tests/models/message.dart';
import 'package:uni_tests/models/recipient.dart';
import 'package:uni_tests/notifications/advertising_notification.dart';
import 'package:uni_tests/notifications/notification.dart';
import 'package:uni_tests/notifications/simple_notification.dart';
import 'package:uni_tests/notifications/urgent_notification.dart';

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

  print("--------------------------------------------------------");
  smsAdapter.send(recipient, "helloooo");
  emailChannel.send(recipient, "hello");
  pushChannel.send(recipient, "hi");


}