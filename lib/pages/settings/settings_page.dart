import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);

  @override
  Widget build(BuildContext context) {
    final size = Size(MediaQuery.of(context).size.width, 75);
    return Scaffold(
      appBar: null,
      backgroundColor: backgroundColor,
      body: Container(
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
                        _buildTileSetting("Stream & download", () {},
                            "Manage quality and Wi-Fi", true),
                        _buildTileSetting("Notification", () {}, "On"),
                        _buildTileSetting(
                            "Auto Play",
                            () {},
                            "Play the next epsode automatically",
                            false,
                            false,
                            true),
                        _buildTileSetting("Parental Controls", () {},
                            "Control what you can watch"),
                        _buildTileSetting("Registered devices Controls", () {},
                            "See all registered devices"),
                        _buildTileSetting("Clear video search history", () {}),
                        _buildTileSetting("Signed in as Hércules", () {},
                            "Sign out of all Amazon apps"),
                        _buildTileSetting("Mamage account", () {},
                            "Access membership information an payment methods"),
                        _buildTileSetting("Manage your Prime Video Channels",
                            () {}, "View or change your subscription"),
                        _buildTileSetting(
                            "Laguange", _goToChangeLanguage, "English"),
                        _buildTileSetting("Contact us", () {}),
                        _buildTileSetting("About & Legal", () {}),
                        _buildTileSetting("Help", () {}, null, false, true),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
        "Settings",
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

  void _goToChangeLanguage() {
    print("Go to change language ${DateTime.now()}");
  }
}
