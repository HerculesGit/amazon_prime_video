import 'dart:async';

import 'package:amazon_prime_video/pages/video_details/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPageDetails extends StatefulWidget {
  @override
  _VideoPageDetailsState createState() => _VideoPageDetailsState();
}

class _VideoPageDetailsState extends State<VideoPageDetails> {
  Map<String, dynamic> movie = {};
  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);
  bool isWatching = false;

  GlobalKey containerKey = GlobalKey();

  GlobalKey appBarKey = GlobalKey();
  GlobalKey appLastContaineKey = GlobalKey();
// Container(key: key,...); //add key to your widget, which position you need to find
// RenderBox box = key.currentContext.findRenderObject();
// Offset position = box.localToGlobal(Offset.zero); //this is global position
// double y = position.dy; //this is y - I think it's what you want

  Timer timer;
  @override
  initState() {
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 5),
    //     (Timer t) => print(" olha eu aqui ${DateTime.now()}"));
  }

  @override
  dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _setDefaultOrientation() {
    if (!isWatching) {
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      calPosition();
    });
    _setDefaultOrientation();

    return Scaffold(
      appBar: null,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCover(),
            _buildTopBody(),
            _buildTabBar(),
          ],
        ),
      ),
    );
  }

  double positionY = 0.0;
  calPosition() {
    RenderBox box = appLastContaineKey.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    positionY = position.dy; //this is y - I think it's what you want

    print('>>>>>>  $positionY');
  }

  Widget _buildTabBar() {
    return Container(
      key: appLastContaineKey,
      color: Colors.red,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            "Related $positionY",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 8.0),
            child: Text(
              "Os Mercenários 3",
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),
          ),
          Text(
            "Include with Prime",
            style: TextStyle(color: Colors.grey[400], fontSize: 10.0),
          ),
          _progressWatching(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildCircleIcon(
                    label: "Start over", icon: Icons.settings_backup_restore),
                _buildCircleIcon(label: "Download", icon: Icons.file_download),
                _buildCircleIcon(label: "Watchlist", icon: Icons.add),
                _buildCircleIcon(label: "Share", icon: Icons.share),
              ],
            ),
          ),
          Text(
            "Barney e sua trupe de mercenários resgatam Doc, um dos integrantes" +
                "do grupo, que estava preso há oito anos. Ao participar" +
                "de uma missão, os mercenáriaos são surpreendidos",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[400]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Quality
              _middleTextMovieInfo(text: "IMDB 6.1"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _middleTextMovieInfo(text: "2014 126 min", noMarginTop: true),
                  _classification(),
                  _subtitleIcon(),
                ],
              ),
              Row(
                children: <Widget>[
                  _middleTextMovieInfo(
                      text: "Language: Audio(2), Subtitles (1)",
                      noMarginTop: true),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey[700]),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _middleTextMovieInfo(
      {@required String text, bool noMarginTop = false}) {
    final middleTextMovieStyle = TextStyle(
      color: Colors.grey[600],
      fontSize: 12.0,
    );
    return Container(
        margin: EdgeInsets.only(top: noMarginTop ? 0.0 : 10.0),
        child: Text(text, style: middleTextMovieStyle));
  }

  Widget _classification() {
    return Card(
      elevation: 0,
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(
          "16",
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ),
    );
  }

  Widget _subtitleIcon() {
    return Container(
      child: Icon(
        Icons.subtitles,
        color: Colors.grey[500],
      ),
    );
  }

  Widget _buildCover() {
    return Container(
      child: Image.network(
        "https://observatoriodocinema.uol.com.br/wp-content/uploads/2015/10/osmercenarios.jpg",
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }

  // Color.fromRGBO(72, 121, 145, 1),
  Widget _progressWatching() {
    final textStyle = TextStyle(
        color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w600);
    final double borderRadius = 4.0;
    return GestureDetector(
      onTap: () => _goToPlayNow(),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(11, 85, 124, 1),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () => _goToPlayNow(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Continue watching", style: textStyle),
                    Text("102 min left", style: textStyle),
                  ],
                ),
              ],
            ),
            Container(
              height: 5.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(72, 121, 145, 1),
              ),
              child: _lineProgress(borderRadius),
            )
          ],
        ),
      ),
    );
  }

  Widget _lineProgress(double borderRadius) {
    return Stack(
      children: <Widget>[
        // Text("kansdkasd"),
        Container(
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(borderRadius)),
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildCircleIcon({@required String label, @required IconData icon}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 4.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: Colors.grey[600],
                width: 2.0,
              ),
            ),
            child: Icon(
              icon,
              size: 20.0,
              color: Colors.grey[600],
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  _goToPlayNow() async {
    isWatching = true;
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideoPlayerPage()),
    );
    setState(() {
      isWatching = false;
    });
  }
}
