import 'package:amazon_prime_video/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'app_settings.g.dart';

class AppSettings = _AppSettingsBase with _$AppSettings;

abstract class _AppSettingsBase with Store {
  @observable
  String currentLanguange;

  @action
  Future<void> changeLanguage(Locale locale, String language) async {
    currentLanguange = language;
    await AppLocalizations.load(locale);
  }
}
