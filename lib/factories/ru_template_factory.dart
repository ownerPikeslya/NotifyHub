import 'package:uni_tests/factories/template_factory.dart';

import '../models/message.dart';

class RuTemplateFactory implements TemplateFactory{

  @override
  Message greeting() => Message("Привет", "Приветствую");
  @override
  Message discount() => Message("Скидка", "Скидка на товар");
  @override
  Message reminder() => Message("Напоминание", "Повторите");
}