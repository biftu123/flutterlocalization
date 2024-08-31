import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutterlocalization/constant.dart/appconstant.dart';
import 'package:flutterlocalization/controller/localizationController.dart';
import 'package:flutterlocalization/mode/languageModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedpreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedpreferences);
  Get.lazyPut(() => Localizationcontroller(sharedPreferences: Get.find()));
  Map<String, Map<String, String>> _languages = {};
  for (Languagemodel languagemodel in Appconstant.languages) {
    String jsonStringValue = await rootBundle
        .loadString('assets/language/${languagemodel.languageCode}.json');
    Map<String, dynamic> _mappedjson = json.decode(jsonStringValue);
    Map<String, String> _json = {};
    _mappedjson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languagemodel.languageCode}_${languagemodel.countryCode}'] =
        _json;
  }
  return _languages;
}
