import 'package:amazon_prime_video/app_localizations.dart';
import 'package:flutter/cupertino.dart';

String getTranslate(BuildContext context, String key) =>
    AppLocalizations.of(context).translate(key);
