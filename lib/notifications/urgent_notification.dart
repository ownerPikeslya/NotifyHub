import 'package:uni_tests/notifications/notification.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class UrgentNotification extends Notification{
  UrgentNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) => channel.send(to, msg.text);
}