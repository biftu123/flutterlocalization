// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class Message extends Translations {
  final Map<String, Map<String, String>> languges;
  Message({
    required this.languges,
  });
  @override
  Map<String, Map<String, String>> get keys {
    return languges;
  }
}
