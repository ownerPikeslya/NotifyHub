import 'package:uni_tests/notifications/notification.dart';
import '../history/notification_history.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class UrgentNotification extends Notification{
  UrgentNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) {
    channel.send(to, "!!! ${msg.title.toUpperCase()}: ${msg.text} !!!" );
    NotificationHistory().add("Urgent: ${msg.title.toUpperCase()}");
}
}
