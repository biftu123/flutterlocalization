// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterlocalization/constant.dart/appconstant.dart';
import 'package:flutterlocalization/constant.dart/message.dart';
import 'package:get/get.dart';


import 'package:flutterlocalization/controller/localizationController.dart';
import 'package:flutterlocalization/homepage.dart';

import 'constant.dart/dep.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> langueges = await dep.init();
  runApp(MyApp(langueges: langueges,));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.langueges,
  }) : super(key: key);
  final Map<String, Map<String, String>> langueges;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localizationcontroller>(
        builder: (Localizationcontroller) {
     return GetMaterialApp(
      
        locale: Localizationcontroller.local,
        translations: Message(languges: langueges),
        fallbackLocale: Locale(Appconstant.languages[0].languageCode,Appconstant.languages[0].countryCode),
        home: const Homepage(),
      );
    });
  }
}
