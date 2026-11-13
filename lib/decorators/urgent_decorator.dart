import 'channel_decorator.dart';
import '../models/recipient.dart';
class EncryptionDecorator extends ChannelDecorator{
  EncryptionDecorator(super.channel);

  @override
  void send(Recipient to, String text) => channel.send(to, text.split('').reversed.join());
}