import 'package:amazon_prime_video/app_localizations.dart';
import 'package:amazon_prime_video/shared/constants/localizations_constants.dart';
import 'package:amazon_prime_video/shared/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String currentLanguage = "English";
  Locale currentLocale;

  Map<String, Map<String, String>> languageMap = {
    "pt": {"BR": "Português (Brasil)"},
    "en": {"US": "English"}
  };

  AppSettings appSettings;

  @override
  void initState() {
    appSettings = Provider.of<AppSettings>(context, listen: false);
    if (appSettings.currentLanguange != null) {
      currentLanguage = appSettings.currentLanguange;
    }
    if (appSettings.currentLocale != null) {
      currentLocale = appSettings.currentLocale;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = Size(MediaQuery.of(context).size.width, 75);

    return Scaffold(
      appBar: null,
      body: Observer(builder: (context) {
        if (appSettings.currentLanguange != null) {}
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 0.6,
                focal: Alignment.topLeft,
                center: Alignment.topLeft,
                stops: [
                  0.02,
                  1.0,
                ],
                colors: [
                  Color.fromRGBO(11, 47, 71, 1),
                  Color.fromRGBO(14, 23, 30, 1),
                ],
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(top: 0, child: _buildAppbar(size)),
                Positioned(
                  top: size.height,
                  child: _buildAllLanguage(size),
                ),
              ],
            ));
      }),
    );
  }

  Widget _buildAppbar(Size preferredSize) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: preferredSize.height,
      width: preferredSize.width,
      alignment: Alignment.bottomCenter,
      child: Text(
        getTranslate(context, "language"),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAllLanguage(Size size) {
    final List<Widget> widgets = [];

    for (var index = 0; index < languageMap.keys.length; index++) {
      final String languageCode = languageMap.keys.toList()[index];
      final Map<String, String> value = languageMap.values.toList()[index];
      final String countryCode = value.keys.toList()[0];
      final String label = value.values.toList()[0];

      widgets.add(_buildTileLanguage(label, () {
        AppLocalizations.load(Locale(languageCode, countryCode)).then((value) {
          setState(() {});
        });
      }, index == 0, index == languageMap.length - 1));
    }

    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTileLanguage("English", () {
            _changeLanguage(Locale('en', 'US'));
          }, true, false),
          _buildTileLanguage("Português (Brasil)", () {
            _changeLanguage(Locale('pt', 'BR'));
          }, false, true),
        ],
      ),
    );
  }

  Widget _buildTileLanguage(String language, Function onPressed,
      [bool isFirst = false, bool isLast = false]) {
    final divider = Divider(color: Colors.grey, height: 2.0);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Column(
        children: <Widget>[
          if (!isFirst) divider,
          Theme(
            data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
                disabledColor: Colors.white),
            child: InkWell(
              onTap: () {
                setState(() => currentLanguage = language);
                onPressed();
              },
              child: Row(
                children: <Widget>[
                  Radio(
                    value: language,
                    groupValue: currentLanguage,
                    onChanged: (value) {
                      setState(() => currentLanguage = value);
                      onPressed();
                    },
                  ),
                  Container(
                    child: Text(
                      language,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLast) divider,
        ],
      ),
    );
  }

  _changeLanguage(Locale locale) {
    this.currentLocale = locale;
    AppLocalizations.load(this.currentLocale).then((value) {
      // setState(() {});
      appSettings.changeLanguage(currentLocale, currentLanguage);
    });
  }
}
