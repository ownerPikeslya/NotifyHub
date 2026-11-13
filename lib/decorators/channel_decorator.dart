import 'channel_decorator.dart';
import 'models/recipient.dart';
class TimeDecorator extends ChannelDecorator{
  TimeDecorator(super.channel);

  @override
  void send(Recipient to, String text) => channel.send(to, "Время: ${DateTime.now()} ${text}");
}