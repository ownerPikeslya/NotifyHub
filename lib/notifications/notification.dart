import 'package:uni_tests/models/message.dart';
import 'package:uni_tests/models/recipient.dart';

import '../channels/channel.dart';

abstract class Notification{
final Channel channel;
Notification(this.channel);

void notify(Recipient to, Message msg);

}