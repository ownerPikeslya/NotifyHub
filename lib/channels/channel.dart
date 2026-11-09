import "../models/recipient.dart";

abstract class Channel {
  void send(Recipient to, String text);
}