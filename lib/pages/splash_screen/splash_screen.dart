import 'package:amazon_prime_video/pages/page_bottom_manager/page_bottom_manager.dart';
import 'package:amazon_prime_video/pages/splash_screen/splash_presenter.dart';
import 'package:amazon_prime_video/shared/settings/app_settings.dart';
import 'package:amazon_prime_video/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);
  SplashPresenter _presenter;

  @override
  void initState() {
    final appSettings = Provider.of<AppSettings>(context, listen: false);
    _presenter = SplashPresenter(context, appSettings);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Future.delayed(Duration(seconds: 2)).then((_) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.black));
      _presenter.loadLang().then((value) => _presenter.goToPageManager());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Prime Video",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: MyProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
