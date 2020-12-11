import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    // Load the language JSON file from the lang folder

    String fileName = locale.languageCode;
    if (locale.languageCode == "pt" && locale.countryCode == "BR") {
      fileName = "pt_br";
    }

    String jsonString = await rootBundle.loadString('lang/$fileName.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return AppLocalizations();
  }

  static Map<String, String> _localizedStrings;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  // this method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key];
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;
  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here

    // if (locale.languageCode == 'pt' && locale.countryCode == 'BR') return true;
    return ["en", "pt"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
