import 'package:uni_tests/factories/template_factory.dart';
import '../models/message.dart';

class UzTemplateFactory implements TemplateFactory{

  @override
  Message greeting() => Message("Salom", "Salom");
  @override
  Message discount() => Message("Chegirma", "Chegirma");
  @override
  Message reminder() => Message("Eslatma", "Eslatma");
}