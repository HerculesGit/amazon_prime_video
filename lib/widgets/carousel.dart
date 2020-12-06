import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<String> photos;
  final Function(int) changePhoto;
  final double width;
  final double height;

  Carousel(
      {@required this.photos,
      @required this.changePhoto,
      @required this.width,
      @required this.height});

  @override
  _CarouselState createState() => _CarouselState(photos, width, height);
}

class _CarouselState extends State<Carousel> {
  final List<String> photos;
  final double width;
  final double height;
  int photoIndex = 0;

  _CarouselState(this.photos, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return _buildCarousel();
  }

  List<Widget> _buildPhotos() {
    List<Widget> widgets = [];
    for (var photo in photos) {
      widgets.add(Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(photo),
            fit: BoxFit.cover,
          ),
        ),
      ));
    }
    return widgets;
  }

  PageController pageController;
  Widget _buildCarousel() {
    return Container(
      color: Colors.grey[300],
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              widget.changePhoto(index);
              setState(() {
                photoIndex = index;
              });
            },
            children: _buildPhotos(),
          ),
          Positioned(
            bottom: 8.0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Dot(
                numberOfDots: photos.length,
                photoIndex: photoIndex,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  Dot({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() => _dot(Colors.grey);

  Widget _activePhoto() => _dot(Colors.white);

  Widget _dot(Color color) => Container(
        child: Padding(
          padding: EdgeInsets.only(left: 2.5, right: 2.5),
          child: Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
                ]),
          ),
        ),
      );

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (var i = 0; i < numberOfDots; i++) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
