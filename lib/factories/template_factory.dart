import 'package:uni_tests/models/message.dart';

abstract class TemplateFactory {
  Message greeting();
  Message discount();
  Message reminder();

}