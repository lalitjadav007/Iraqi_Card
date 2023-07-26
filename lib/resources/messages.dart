import 'package:cards_store/resources/ar.dart';
import 'package:cards_store/resources/en.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': En().messages,
    'ar': Ar().messages,
  };
}