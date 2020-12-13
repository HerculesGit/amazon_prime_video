import 'package:amazon_prime_video/pages/page_bottom_manager/page_bottom_manager.dart';
import 'package:amazon_prime_video/shared/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_localizations.dart';
import 'pages/language_pape/language_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => AppSettings()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AppLocalizationDelegate _localeOverrideDelegate =
      AppLocalizationDelegate(Locale('en', 'US'));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));

    return MaterialApp(
      title: 'Prime Video',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [
        Locale("en", "US"),
        Locale("pt", "BR"),
      ],
      localizationsDelegates: [
        _localeOverrideDelegate,

        // Built-in localization of basic text for Material Widgets
        GlobalMaterialLocalizations.delegate,

        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],

      // this method is called when user changes the language in the device settings
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        // for (var supportedLocale in supportedLocales) {
        //   if (supportedLocale.languageCode == locale.languageCode &&
        //       supportedLocale.countryCode == locale.countryCode) {
        //     return supportedLocale;
        //   }
        // }

        // If the locale of the device is not supported, use the first one
        // from the list (Englis, in this case).
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      home: PageBottomManager(),
    );
  }
}
