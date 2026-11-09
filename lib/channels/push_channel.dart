import '../models/recipient.dart';
import 'channel.dart';

class PushChannel extends Channel {
  @override
  void send(Recipient to, String text) => print("Push Channel:${to.phone} Text:$text");
}