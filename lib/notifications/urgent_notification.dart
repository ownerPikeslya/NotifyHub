import 'package:uni_tests/notifications/notification.dart';
import '../history/notification_history.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class UrgentNotification extends Notification{
  UrgentNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) {
    bool ok = channel.send(to, "!!! ${msg.title.toUpperCase()}: ${msg.text} !!!", priority: 1);
    NotificationHistory().add("Urgent: ${msg.title.toUpperCase()}");
    NotificationHistory().addType("Urgent");
    NotificationHistory().addChannel(channel.name);
    if (!ok) NotificationHistory().addError();
}
}
