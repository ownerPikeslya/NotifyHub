import 'package:uni_tests/channels/channel.dart';
import 'package:uni_tests/channels/email_channel.dart';
import 'package:uni_tests/channels/legacy_sms_gateway.dart';
import 'package:uni_tests/channels/push_channel.dart';
import 'package:uni_tests/channels/sms_adapter.dart';
import 'package:uni_tests/models/message.dart';
import 'package:uni_tests/models/recipient.dart';
import 'package:uni_tests/notifications/notification.dart';
import 'package:uni_tests/notifications/urgent_notification.dart';

void main(){
  EmailChannel emailChannel = EmailChannel();
  PushChannel pushChannel = PushChannel();
  SmsAdapter smsAdapter = SmsAdapter(LegacySmsGateway());
  UrgentNotification urgentNotification = UrgentNotification(smsAdapter);

  Recipient recipient = Recipient("mike", "smth@gmail.com","+998777777777");
  Message message = Message("Skidka", "Segodnya");

  urgentNotification.notify(recipient, message);
  smsAdapter.send(recipient, "helloooo");
  emailChannel.send(recipient, "hello");
  pushChannel.send(recipient, "hi");


}