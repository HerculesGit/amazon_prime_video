import 'package:amazon_prime_video/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final moviesController = ScrollController();
  final timeAndYearStyle = TextStyle(
    color: Colors.grey[600],
    fontSize: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
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
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                _buildAppBar(),
                _buildWatchlistTitle(),
                _buildFilter(),
                _buildVideoList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.only(top: 32.0),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(31, 127, 169, 1),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(Icons.person),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Hércules",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
            onPressed: () => print("dropdown"),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            onPressed: _goToSettings,
          )
        ],
      ),
    );
  }

  Widget _buildWatchlistTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(
            "Watchlist",
            style: TextStyle(
              color: Colors.grey[100],
            ),
          ),

          // vertical line full widht
          Container(
            margin: EdgeInsets.only(top: 15.0),
            constraints: BoxConstraints(
              maxHeight: 1.5,
              minHeight: 1.5,
              minWidth: MediaQuery.of(context).size.width,
            ),
            color: Colors.grey[600],
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Watchlist",
                      style: TextStyle(color: Colors.transparent)),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilter() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text("1 video", style: timeAndYearStyle),
          ),
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () => print("filter"),
              child: Card(
                color: Color.fromRGBO(64, 83, 98, 1),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Filter",
                        style: TextStyle(color: Colors.white, fontSize: 10.0))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoList() {
    return _buildmovieTile();
  }

  Widget _buildmovieTile() {
    return Container(
      height: 100,
      color: Color.fromRGBO(27, 37, 47, 1),
      child: Row(
        children: <Widget>[
          //  image
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Image.network(
              'https://images4.alphacoders.com/965/thumb-350-965688.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // movie info
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Robin Hood (2018)",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text("2018", style: timeAndYearStyle),
                      SizedBox(width: 8.0),
                      Text("116 min", style: timeAndYearStyle),
                    ],
                  ),
                ),
                // Text("Prime"),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _goToSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }
}
