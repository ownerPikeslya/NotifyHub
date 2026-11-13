import 'channel_decorator.dart';
import '../models/recipient.dart';
class Time extends ChannelDecorator{
  Time(super.channel);

  @override
  void send(Recipient to, String text) => channel.send(to, "Время: ${DateTime.now()} ${text}");
}