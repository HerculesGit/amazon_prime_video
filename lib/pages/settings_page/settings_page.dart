import 'package:amazon_prime_video/pages/language_pape/language_page.dart';
import 'package:amazon_prime_video/shared/constants/localizations_constants.dart';
import 'package:amazon_prime_video/shared/settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);
  AppSettings appSettings;
  @override
  void didChangeDependencies() {
    appSettings = Provider.of<AppSettings>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = Size(MediaQuery.of(context).size.width, 75);
    return Scaffold(
      appBar: null,
      backgroundColor: backgroundColor,
      body: Observer(
        builder: (context) => Container(
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
              Positioned(
                top: 0,
                child: _buildAppbar(size),
              ),
              Positioned(
                top: size.height,
                child: Container(
                  height: MediaQuery.of(context).size.height - size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildTileSetting(
                              getTranslate(
                                  context, "settings_page_stream_and_download"),
                              () {},
                              getTranslate(context,
                                  "settings_page_manage_quality_and_wifi"),
                              true),
                          _buildTileSetting(
                              getTranslate(
                                  context, "settings_page_notification"),
                              () {},
                              getTranslate(context, "settings_page_on")),
                          _buildTileSetting(
                              getTranslate(context, "settings_page_autoplay"),
                              () {},
                              getTranslate(
                                  context, "settings_page_play_next_epsode"),
                              false,
                              false,
                              true),
                          _buildTileSetting(
                              getTranslate(
                                  context, "settings_page_parental_controls"),
                              () {},
                              getTranslate(context,
                                  "settings_page_control_what_you_can_watch")),
                          _buildTileSetting(
                              getTranslate(
                                  context, "settings_page_registered_devides"),
                              () {},
                              getTranslate(context,
                                  "settings_page_see_all_registered_devices")),
                          _buildTileSetting(
                              getTranslate(context,
                                  "settings_page_clear_video_search_history"),
                              () {}),
                          _buildTileSetting(
                              getTranslate(
                                      context, "settings_page_signed_in_as") +
                                  " Hércules",
                              () {},
                              getTranslate(context,
                                  "settings_page_sign_out_of_all_amazon_apps")),
                          _buildTileSetting(
                              getTranslate(
                                  context, "settings_page_manage_account"),
                              () {},
                              getTranslate(context,
                                  "settings_page_access_menbership_information_an_payment_methods")),
                          _buildTileSetting(
                              getTranslate(context,
                                  "settings_page_manage_your_prime_video_channels"),
                              () {},
                              getTranslate(context,
                                  "settings_page_view_or_change_your_subscription")),
                          _buildTileSetting(
                              getTranslate(context, "settings_page_language"),
                              _goToChangeLanguage,
                              appSettings.currentLanguange == null
                                  ? "English"
                                  : appSettings.currentLanguange),
                          _buildTileSetting(
                              getTranslate(context, "settings_page_contact_us"),
                              () {}),
                          _buildTileSetting(
                              getTranslate(
                                  context, "settings_page_about_and_legal"),
                              () {}),
                          _buildTileSetting(
                              getTranslate(context, "settings_page_help"),
                              () {},
                              null,
                              false,
                              true),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar(Size preferredSize) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: preferredSize.height,
      width: preferredSize.width,
      alignment: Alignment.bottomCenter,
      child: Text(
        getTranslate(context, "settings_page_settigs"),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  bool autoPlay = true;
  Widget _buildTileSetting(String text, Function onPressed,
      [String subTitle,
      bool isFirst = false,
      bool isLast = false,
      bool showAutoPlay = false]) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            if (!isFirst) Divider(height: 2.0, color: Colors.grey),
            SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    if (isLast) Container(height: 15),
                    if (subTitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          subTitle,
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                  ],
                ),
                if (showAutoPlay) Spacer(),
                if (showAutoPlay)
                  Switch(
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey[300],
                    value: autoPlay,
                    onChanged: (newValue) {
                      setState(() => autoPlay = newValue);
                    },
                  )
              ],
            ),
            if (isLast) Divider(height: 2.0, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Future<void> _goToChangeLanguage() async {
    final List results = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LanguagePage(),
      ),
    );
    if (results != null) {
      appSettings.changeLanguage(results.first, results.last);
    }
  }
}
