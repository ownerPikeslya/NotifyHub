import 'package:uni_tests/notifications/notification.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class AdvertisingNotification extends Notification{
  AdvertisingNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) => channel.send(to, "Реклама: ${msg.title}: ${msg.text}");
}