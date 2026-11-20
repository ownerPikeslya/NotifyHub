import 'package:uni_tests/notifications/notification.dart';
import '../history/notification_history.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class AdvertisingNotification extends Notification {
  AdvertisingNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) {
    bool ok = channel.send(to, "Реклама: ${msg.title}: ${msg.text}", priority: 3);
    NotificationHistory().add("Advertising: ${msg.title} ");
    NotificationHistory().addType("Advertising");
    NotificationHistory().addChannel(channel.name);
    if (!ok) NotificationHistory().addError();
  }
}
