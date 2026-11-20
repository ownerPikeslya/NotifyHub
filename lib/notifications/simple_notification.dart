import 'package:uni_tests/history/notification_history.dart';
import 'package:uni_tests/notifications/notification.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class SimpleNotification extends Notification{
  SimpleNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) {
    bool ok = channel.send(to, "${msg.title}: ${msg.text}", priority: 2);
    NotificationHistory().add("Simple: ${msg.title}");
    NotificationHistory().addType("Simple");
    NotificationHistory().addChannel(channel.name);
    if (!ok) NotificationHistory().addError();
  }
}
