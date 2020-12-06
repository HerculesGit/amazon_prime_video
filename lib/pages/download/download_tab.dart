import 'package:flutter/material.dart';

class DownloadTab extends StatefulWidget {
  @override
  _DownloadTabState createState() => _DownloadTabState();
}

class _DownloadTabState extends State<DownloadTab> {
  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: null,
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAppBar(),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    final videosSecondStyle = TextStyle(
      color: Colors.grey[600],
      fontSize: 12.0,
    );
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 16.0),
      child: Row(
        children: <Widget>[
          Text("0 videos", style: videosSecondStyle),
          _dotSeparator(),
          Text("0 secs", style: videosSecondStyle),
          _dotSeparator(),
          Text("0MB", style: videosSecondStyle),
        ],
      ),
    );
  }

  Widget _dotSeparator() => Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 3.5,
        width: 3.5,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(100.0),
        ),
      );

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 100.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            Icons.file_download,
            color: Colors.grey[500],
          ),
          Text(
            "No videos downloaded",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          )
        ],
      ),
    );
  }
}
