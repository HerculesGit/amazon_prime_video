import 'package:amazon_prime_video/pages/home/home_presenter.dart';
import 'package:amazon_prime_video/pages/video_details/video_details_page.dart';
import 'package:amazon_prime_video/repositories/watchable_respository.dart';
import 'package:amazon_prime_video/widgets/carousel.dart';
import 'package:amazon_prime_video/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements IHomeContract {
  HomePresenter presenter;

  Size _size;

  static final String txtTabHome = 'Home';
  static final String txtTvShows = 'TV Shows';
  static final String txtMovies = 'Movies';
  static final String txtKids = 'Kids';

  int tabIndex = 0;

  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);
  TextStyle textStyleBar = TextStyle(
      color: Color.fromRGBO(135, 145, 154, 1),
      fontWeight: FontWeight.w600,
      fontSize: 12.0);

  @override
  initState() {
    super.initState();
    presenter = HomePresenter(this, WatchableRepository());
    presenter.findAllWatchableByCategory(txtTabHome);
  }

  @override
  Widget build(BuildContext context) {
    _size = (MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(),
          _buildCarousel(),
          _buildBodyObservable(),
        ],
      ),
    );
  }

  Widget _sliverAppBar() => SliverAppBar(
        backgroundColor: backgroundColor,
        pinned: true,
        snap: true,
        floating: true,
        expandedHeight: 80.0,
        excludeHeaderSemantics: true,
        stretch: false,
        primary: true,
        centerTitle: true,
        title: Text(
          "Prime Video",
          style: TextStyle(fontSize: 16),
        ),
        bottom: PreferredSize(
          preferredSize: Size(50, 40),
          child: Container(
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _tabBar(txtTabHome, 0),
                _tabBar(txtTvShows, 1),
                _tabBar(txtMovies, 2),
                _tabBar(txtKids, 3),
              ],
            ),
          ),
        ),
      );

  Widget _tabBar(String text, int index) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        hoverColor: Colors.red,
        splashColor: Colors.transparent,
        onTap: () {
          print("$text");
          presenter.findAllWatchableByCategory(text);
          setState(() {
            tabIndex = index;
          });
        },
        child: Column(
          children: <Widget>[
            Expanded(child: Text(text, style: textStyleBar)),
            Container(
              constraints: BoxConstraints(maxHeight: 2.0, minHeight: 2.0),
              margin: EdgeInsets.only(left: 5, right: 5),
              color: (index == tabIndex) ? Colors.white : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          child: Observer(builder: (_) {
            if (presenter.loading) return Container();
            List<String> photos = presenter.photos.toList();
            return Carousel(
                photos: photos,
                changePhoto: (index) {
                  print(index);
                },
                width: _size.width,
                height: _size.height * 0.2);
          }),
        ),
        childCount: 1,
      ),
    );
  }

  Widget _buildBodyObservable() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, _) => Observer(
          builder: (context) {
            if (presenter.loading) {
              return Container(
                  height: 200, child: Center(child: MyProgressIndicator()));
            }

            List categories = (presenter.data['categories'] as List);
            return Column(
              children: _buildWidgetCategories(categories),
            );
          },
        ),
        childCount: 1,
      ),
    );
  }

  List<Widget> _buildWidgetCategories(List categories) {
    List<Widget> categoriesWidget = [];
    categories.forEach(
      (category) => categoriesWidget.add(Container(
        margin: EdgeInsets.only(bottom: 16.0),
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.only(left: 14.0),
              child: Text(
                category['name'],
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            _buildMovies(category['movies'])
          ],
        ),
      )),
    );

    return categoriesWidget;
  }

  Widget _buildMovies(List<Map<String, dynamic>> movies) => Flexible(
        fit: FlexFit.loose,
        child: ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            double marginLeft = 0.0;
            double marginRight = 8.0;

            if (index == 0) marginLeft = 14.0;
            if (index == movies.length - 1) marginRight = 14.0;

            return GestureDetector(
              onTap: () => _goToVideoDetailsPage(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movies[index]['url']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey,
                ),
                margin: EdgeInsets.only(right: marginRight, left: marginLeft),
                // child: Text(movies[index]['name']),
              ),
            );
          },
        ),
      );

  _goToVideoDetailsPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPageDetails(),
        ));
  }
}
