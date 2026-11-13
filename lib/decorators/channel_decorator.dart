import '../channels/channel.dart';
import '../models/recipient.dart';


abstract class ChannelDecorator implements Channel{
  final Channel channel;
  ChannelDecorator(this.channel);

  @override
  void send(Recipient to, String text) => channel.send(to, text);

}