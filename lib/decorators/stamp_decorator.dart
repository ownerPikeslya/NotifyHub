import 'channel_decorator.dart';
import '../models/recipient.dart';
class StampDecorator extends ChannelDecorator{
  StampDecorator(super.channel);

  @override
  void send(Recipient to, String text) => channel.send(to, "Подпись: NotifyHub ${text}");
}