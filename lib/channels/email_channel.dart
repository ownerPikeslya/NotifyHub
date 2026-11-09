import '../models/recipient.dart';
import 'channel.dart';

class EmailChannel extends Channel {
  @override
  void send(Recipient to, String text) => print("Email Channel:${to.email} Text:$text");
}