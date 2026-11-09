import 'package:uni_tests/notifications/notification.dart';
import '../models/message.dart';
import '../models/recipient.dart';


class SimpleNotification extends Notification{
  SimpleNotification(super.channel);

  @override
  void notify(Recipient to, Message msg) => channel.send(to, "${msg.title}: ${msg.text}");
}