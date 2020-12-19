import 'package:amazon_prime_video/pages/page_bottom_manager/page_bottom_manager.dart';
import 'package:amazon_prime_video/shared/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'splash_presenter.g.dart';

class SplashPresenter = _SplashPresenterBase with _$SplashPresenter;

abstract class _SplashPresenterBase with Store {
  final AppSettings appSettings;

  final BuildContext context;

  _SplashPresenterBase(this.context, this.appSettings);

  bool loading = false;

  loadLang() async {
    await appSettings.loadLocalStorage();
  }

  void goToPageManager() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => PageBottomManager()),
        (Route<dynamic> route) => false);
  }
}
