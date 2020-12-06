import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.01, 0.51, 0.99],
            colors: [
              Color.fromRGBO(11, 47, 71, 1),
              Color.fromRGBO(20, 26, 50, 1),
              Color.fromRGBO(36, 22, 56, 1),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            _sliverAppBar(),
            _buildBrowseBy(),
            _buildGeners(),
            _buildCategory(),
            _buildChannels(),
          ],
        ),
      ),
    );
  }

  _sliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: false,
      excludeHeaderSemantics: true,
      stretch: false,
      primary: true,
      centerTitle: true,
      title: Container(),
      bottom: PreferredSize(
        preferredSize: Size(50, 40),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: "Search by actor, title...",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,

              // normal border
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[800], width: 1.0),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: Icon(Icons.mic, color: Colors.grey),
              // filled: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [
            0.01,
            0.51,
            0.99,
          ],
          colors: [
            Color.fromRGBO(11, 47, 71, 1),
            Color.fromRGBO(20, 26, 50, 1),
            Color.fromRGBO(36, 22, 56, 1),
          ],
        ),
      ),
      child: Container(),
    );
  }

  Widget _buildBrowseBy() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title("Browse by"),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _browseRow(["Included with Prime", "Channels"]),
                    _browseRow(["TV", "Movie"]),
                    _browseRow(["Amazon Originals", "Kids"]),
                  ],
                )
              ],
            ),
          ),
        ),
        childCount: 1,
      ),
    );
  }

  Widget _browseRow(List<String> twoOptions) {
    List<Expanded> options = [];
    bool even = false;
    for (var text in twoOptions) {
      options.add(
        Expanded(
          child: InkWell(
            onTap: () {
              print(text);
            },
            child: Container(
              padding: EdgeInsets.all(14.0),
              margin: EdgeInsets.only(
                left: even ? 8.0 : 0.0,
                bottom: 6.0,
              ),
              color: Color.fromRGBO(27, 35, 48, 1),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.w700,
                    fontSize: 10.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      even = true;
    }
    //                    color: Color.fromRGBO(27, 35, 48, 1),
    return Row(
      children: <Widget>[...options],
    );
  }

  List<String> geners = [
    "Action and adventure",
    "Comedy",
    "Drama",
    "Documentary",
    "Kids an family",
    "Fantasy",
    "Horror",
    "Romance"
  ];
  Widget _buildGeners() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _title("Genres"),
              _tilesList([
                "Action and adventure",
                "Comedy",
                "Drama",
                "Fantasy",
                "Documentary",
                "Kids and family",
              ]),
            ],
          ),
        ),
        childCount: 1,
      ),
    );
  }

  Widget _buildCategory() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _title("Categories"),
              _tilesList([
                "Recently added movies",
                "Recently added TV",
                "Top movies",
                "Top TV",
                "Fantasy",
              ]),
            ],
          ),
        ),
        childCount: 1,
      ),
    );
  }

  Widget _buildChannels() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _title("Channels"),
              _tilesList([
                "Starzplay",
                "Paramount+",
                "MGM",
                "Looke",
                "Noggin",
              ]),
            ],
          ),
        ),
        childCount: 1,
      ),
    );
  }

  Widget _tilesList(List<String> geners) {
    List<Widget> widgets = [];
    bool first = true;
    bool last = false;
    for (var gener in geners) {
      if (gener == geners.last) last = true;
      widgets.add(InkWell(
        onTap: () => print(gener),
        child: Column(
          children: <Widget>[
            if (first) Divider(color: Colors.grey, height: 2.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Center(
                    child: Text(
                      gener,
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[400],
                    size: 20.0,
                  ),
                  SizedBox(width: 10.0),
                ],
              ),
            ),
            if (!last) Divider(color: Colors.grey, height: 2.0),
          ],
        ),
      ));
      first = false;
    }

    return Column(
      children: <Widget>[...widgets],
    );
  }

  _title(String title) => Container(
        margin: EdgeInsets.only(top: 16.0, bottom: 12.0),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
            color: Colors.grey[100],
          ),
        ),
      );
}
