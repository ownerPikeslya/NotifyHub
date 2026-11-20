import 'package:uni_tests/models/message.dart';

// Abstract Factory: создаёт семейство шаблонов на одном языке (Ru / Uz / Eng).
abstract class TemplateFactory {
  Message greeting();
  Message discount();
  Message reminder();

}
