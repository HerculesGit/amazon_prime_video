import 'package:amazon_prime_video/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  bool isWatching = false;
  @override
  void initState() {
    _setLandscapeOrientation();
    _loadVideo();
    super.initState();
  }

  void _setLandscapeOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  void _loadVideo() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState != ConnectionState.done) {
              return MyProgressIndicator();
            }
            _playWhenVideoIsLoaded();

            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: VideoPlayer(
                            _controller,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _pausePlayIcon(60.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _playWhenVideoIsLoaded() {
    if (!isWatching) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        isWatching = true;
        _playVideo(_controller.value.isPlaying);
      });
    }
  }

  Widget _pausePlayIcon(double size) {
    bool isPlaying = _controller.value.isPlaying;
    return Positioned(
      top: (MediaQuery.of(context).size.height - size) / 2,
      left: (MediaQuery.of(context).size.width - size) / 2,
      child: GestureDetector(
        onTap: () => _playVideo(isPlaying),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }

  void _playVideo(bool isPlaying) {
    setState(() {
      if (isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }
}
