import '../models/recipient.dart';
import 'channel.dart';
import 'legacy_sms_gateway.dart';

class SmsAdapter implements Channel {
  final LegacySmsGateway legacySmsGateway;
  SmsAdapter(this.legacySmsGateway);

  @override
  void send(Recipient to, String text) => legacySmsGateway.sendSms(to.phone, text);
}