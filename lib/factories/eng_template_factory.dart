import 'package:uni_tests/factories/template_factory.dart';

import '../models/message.dart';

class EngTemplateFactory implements TemplateFactory{

  @override
  Message greeting() => Message("Hello", "Hello");
  @override
  Message discount() => Message("Discount", "Discount");
  @override
  Message reminder() => Message("Reminder", "Reminder");
}