import 'channel_decorator.dart';
import '../models/recipient.dart';
class UrgentDecorator extends ChannelDecorator{
  UrgentDecorator(super.channel);

  @override
  void send(Recipient to, String text) => channel.send(to, "Срочно: $text");
}