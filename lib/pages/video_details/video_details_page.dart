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
            _buildCastCrew(),
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

  Widget _buildCastCrew() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Cast & Crew",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Details from",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[400],
                    ),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      "IMDb",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Wrap(
            // crossAxisCount: 3,
            runAlignment: WrapAlignment.spaceAround,
            alignment: WrapAlignment.spaceBetween,
            // crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            runSpacing: 10,
            spacing: 10,
            children: <Widget>[
              _buildImageCast(),
              _buildImageCast(),
              _buildImageCast(),
              _buildImageCast(),
            ],
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          ),
          _buildDirectorCrew(),
        ],
      ),
    );
  }

  Widget _buildImageCast() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(
            'https://m.media-amazon.com/images/M/MV5BMTYzODU2OTI2Nl5BMl5BanBnXkFtZTgwMTUyMTAwMzE@._V1_.jpg',
            width: MediaQuery.of(context).size.width / 3 - 18,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Text(
              "Taron Ederton",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            )),
      ],
    );
  }

  Widget _buildDirectorCrew() {
    return Container(
      margin: EdgeInsets.only(bottom: 100.0, top: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Color.fromRGBO(41, 54, 71, 1),
            ),
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 8.0, bottom: 25, right: 8.0),
                  child: Icon(
                    Icons.star_border,
                    color: Colors.amber,
                    size: 80,
                  ),
                ),
                Positioned(
                  bottom: 2.0,
                  left: 40 / 2,
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      "Otto Bathurst",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Director",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Know: Robin Hood (2018), Peaky asdasdasd Blinders (2013), Black Mirror (2011)",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
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
                    label: "Start over",
                    icon: Icons.settings_backup_restore,
                    onPressed: null),
                _buildCircleIcon(
                    label: "Download",
                    icon: Icons.file_download,
                    onPressed: null),
                _buildCircleIcon(
                    label: "Watchlist", icon: Icons.add, onPressed: null),
                _buildCircleIcon(
                    label: "Share",
                    icon: Icons.share,
                    onPressed: _sharedWatchable),
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
          return Container(
            height: MediaQuery.of(context).size.width / 2,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
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

  Widget _buildCircleIcon(
      {@required String label,
      @required IconData icon,
      @required Function onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }

  void _sharedWatchable() {
    String name = "Mercenarios 3";
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(24, 31, 39, 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16.0, left: 20.0, bottom: 10.0),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            _tileButton("SMS", Icons.sms),
            _tileButton("Copy", Icons.link),
            _tileButton("More", Icons.more_horiz, true),
          ],
        ),
      ),
    );
  }

  Widget _tileButton([String text, IconData icon, bool isLastItem = false]) {
    return InkWell(
      onTap: () => print(text),
      child: Padding(
        padding:
            EdgeInsets.only(top: 14.0, left: 14.0, bottom: isLastItem ? 20 : 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: Colors.grey[400]),
            Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(text,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[400],
                    ))),
          ],
        ),
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
