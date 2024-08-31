import 'package:flutter/material.dart';
import 'package:flutterlocalization/constant.dart/appconstant.dart';
import 'package:flutterlocalization/mode/languageModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Localizationcontroller extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  Localizationcontroller({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }
  Locale _locale = Locale(Appconstant.languages[0].languageCode,
      Appconstant.languages[0].countryCode);
  int _selectedIndex = 0;
  List<Languagemodel> _languages = [];
  Locale get local => _locale;
  int get selectedIndex => _selectedIndex;
  void loadCurrentLanguage() async {
    _locale = Locale(
        sharedPreferences.getString(Appconstant.languageCode) ??
            Appconstant.languages[0].languageCode,
        sharedPreferences.getString(Appconstant.countryCode) ??
            Appconstant.languages[0].countryCode);
    for (int index = 0; index < Appconstant.languages.length; index++) {
      if (Appconstant.languages[index].languageCode == _locale) {
        _selectedIndex = index;
        break;
      }
    }
    _languages = [];
    _languages.addAll(Appconstant.languages);
    update();
  }

  void setlanguage(Locale local) {
    Get.updateLocale(local);
    _locale = local;
    saveLanguage(_locale);
    update();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void saveLanguage(Locale local) {
    sharedPreferences.setString(Appconstant.languageCode, local.languageCode);
    sharedPreferences.setString(Appconstant.countryCode, local.countryCode!);
  }
}
