import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final String countryCode = "countryCode";
  final String languageCode = "languageCode";
  final String currentLanguage = "currentLanguage";

  SharedPreferences _sharedPreferences;

  _load() async {
    if (_sharedPreferences == null)
      _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setLang({
    @required String countryCode,
    @required String languageCode,
    @required String currentLanguage,
  }) async {
    await _load();
    _sharedPreferences.setString(this.countryCode, countryCode);
    _sharedPreferences.setString(this.languageCode, languageCode);
    _sharedPreferences.setString(this.currentLanguage, currentLanguage);
  }

  Future<Map<String, dynamic>> getLang() async {
    Map<String, dynamic> lang = {};
    await _load();
    String langCode = _sharedPreferences.getString(this.languageCode);
    String countryCode = _sharedPreferences.getString(this.countryCode);
    final currentLang = _sharedPreferences.getString(this.currentLanguage);
    if (langCode == null || countryCode == null || currentLang == null) {
      return null;
    }

    final locale = Locale(langCode, countryCode);
    lang = {'locale': locale, 'currentLanguage': currentLang};
    return lang;
  }
}

// class Lang {
//   Locale locale;
//   String currentLanguage;

//   Locale toLocale(String countryCode, String languageCode) {
//     return Locale(languageCode, countryCode);
//   }
// }
