import 'package:uni_tests/notifications/notification.dart';
import '../history/notification_history.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class AdvertisingNotification extends Notification {
  AdvertisingNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) {
    channel.send(to, "Реклама: ${msg.title}: ${msg.text}");
    NotificationHistory().add("Advertising: ${msg.title}");
  }
}
