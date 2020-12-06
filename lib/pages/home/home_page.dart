import 'package:amazon_prime_video/pages/video_details/video_details_page.dart';
import 'package:amazon_prime_video/widgets/carousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size _size;

  List<String> photos = [
    'assets/images/sasuke.jpg',
    'assets/images/sasuke_horizon.jpg'
  ];

  Map<String, dynamic> mockData = {
    'categories': [
      {
        'name': 'Amazon Originals an Exclusives',
        'movies': [
          {
            'name': 'STUMPTOWN',
            'url':
                'https://poltronanerd.com.br/wp-content/uploads/2020/09/Stumptown.jpg'
          },
          {
            'name': 'UTOPIA',
            'url': 'https://i.vimeocdn.com/video/836493924_1280x720.jpg'
          },
          {
            'name': 'ALEX RIDER',
            'url': 'https://i.ytimg.com/vi/U9g9A005UNQ/maxresdefault.jpg'
          }
        ],
      },
      {
        'name': 'Recommended movies',
        'movies': [
          {
            'name': 'CÃO DE BRIGA',
            'url':
                'https://images.justwatch.com/backdrop/8871157/s1440/cao-de-briga.jpg'
          },
          {
            'name': 'RAMBO',
            'url': 'https://i.ytimg.com/vi/sGTGdpwcxP0/maxresdefault.jpg'
          },
          {
            'name': 'PRISION BREAK',
            'url':
                'https://cdn.fstatic.com/media/movies/photos/2019/06/prison-break-o-resga_t13341.jpg'
          }
        ],
      },
      {
        'name': 'TV show we think you\'ll like',
        'movies': [
          {
            'name': 'BLACK BOX',
            'url': 'https://i.ytimg.com/vi/Qrc8wQqnl0g/maxresdefault.jpg'
          },
          {
            'name': 'HAND NIGHT',
            'url': 'https://i.ytimg.com/vi/BJsQ6zGsnVg/maxresdefault.jpg'
          }
        ],
      },
      {
        'name': 'Recently added movies',
        'movies': [
          {
            'name': 'OLHOS DE DRAGÃO',
            'url': 'https://i.ytimg.com/vi/CK5jXnJA_-Q/maxresdefault.jpg'
          },
          {
            'name': 'RAMBO',
            'url':
                'https://hmlobservatoriodocinema.elav.tmp.br/wp-content/uploads/2018/07/Jean-Claude-Van-Damme-O-Grande-Dragao-Branco.jpg'
          },
          {
            'name': 'RINGUE DA MORTE',
            'url': 'https://i.ytimg.com/vi/GkzhFUa4SQ8/maxresdefault.jpg'
          }
        ],
      }
    ],
  };

  int tabIndex = 0;

  Color backgroundColor = Color.fromRGBO(14, 23, 30, 1);
  TextStyle textStyleBar = TextStyle(
      color: Color.fromRGBO(135, 145, 154, 1),
      fontWeight: FontWeight.w600,
      fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    _size = (MediaQuery.of(context).size);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          _sliverAppBar(),
          _buildCarousel(),
          _buildHome(),
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
                _tabBar("Home", 0),
                _tabBar("TV Shows", 1),
                _tabBar("Movies", 2),
                _tabBar("Kids", 3),
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

  // Widget _tabBarView() {}

  Widget _buildCarousel() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          child: Carousel(
              photos: photos,
              changePhoto: (index) {
                print(index);
              },
              width: _size.width,
              height: _size.height * 0.2),
        ),
        childCount: 1,
      ),
    );
  }

  // Widget _buildView() {

  // }

  Widget _buildHome() {
    List categories = (mockData['categories'] as List);
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
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
                  categories[index]['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              _buildMovies(categories[index]['movies'])
            ],
          ),
        );
      }, childCount: categories.length),
    );
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
