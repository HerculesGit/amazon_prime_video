import 'package:amazon_prime_video/app_localizations.dart';
import 'package:amazon_prime_video/shared/local_storage.dart/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'app_settings.g.dart';

class AppSettings = _AppSettingsBase with _$AppSettings;

abstract class _AppSettingsBase with Store {
  @observable
  String currentLanguange;

  @observable
  Locale currentLocale;

  @observable
  bool loading = false;

  @action
  Future<void> changeLanguage(Locale locale, String language) async {
    currentLanguange = language;
    await LocalStorage().setLang(
        countryCode: locale.countryCode,
        languageCode: locale.languageCode,
        currentLanguage: currentLanguange);
    await AppLocalizations.load(locale);
  }

  @action
  loadLocalStorage() async {
    loading = true;
    Map<String, dynamic> lang = await LocalStorage().getLang();

    if (lang != null) {
      currentLocale = lang["locale"];
      currentLanguange = lang["currentLanguage"];
      await AppLocalizations.load(this.currentLocale);
    }
    loading = false;
  }
}
