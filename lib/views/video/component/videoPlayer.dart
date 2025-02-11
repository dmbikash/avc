
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../services/routes.dart';
import '../../../theme/border_radius.dart';
import '../../../theme/padding.dart';
class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key, required this.videoID});

  final String videoID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ThemePadding.p2.copyWith(bottom: ThemePadding.value * 10),
      child: Material(
        borderRadius: ThemeBorderRadius.r4,
        elevation: 10,
        child: InkWell(
          onTap: () => route(context, VideoPlayerYouTube(videoID: videoID)),
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 300 / (16 / 9),
            decoration: BoxDecoration(
              borderRadius: ThemeBorderRadius.r4,
              image: DecorationImage(
                image: CachedNetworkImageProvider("https://i3.ytimg.com/vi/$videoID/hqdefault.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Image.asset("asset/icon/play.png", width: 64, height: 64),
          ),
        ),
      ),
    );
  }
}

class VideoPlayerYouTube extends StatefulWidget {
  const VideoPlayerYouTube({super.key, required this.videoID});

  final String videoID;

  @override
  State<VideoPlayerYouTube> createState() => _VideoPlayerYouTubeState();
}

class _VideoPlayerYouTubeState extends State<VideoPlayerYouTube> {
  late final YoutubePlayerController _controller = YoutubePlayerController(

    initialVideoId: widget.videoID,

    flags: const YoutubePlayerFlags(
        autoPlay: true,
        forceHD: true,
        hideControls: true
    ),
  );

  @override
  Widget build(BuildContext context) => SafeArea(
    child: RotatedBox(
      quarterTurns: 0,
      child: YoutubePlayerBuilder(

        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: false,
          onReady: () {
            print("---a-a--a-a--a-a-a--a");
          },
        ),
        builder: (context, player) => player,
      ),
    ),
  );
}



class VideoPlayerYouTube2 extends StatefulWidget {

  var onReady;

  VideoPlayerYouTube2({

    super.key, required this.videoID,
    required this.onReady

  });

  final String videoID;

  @override
  State<VideoPlayerYouTube2> createState() => _VideoPlayerYouTube2State();
}

class _VideoPlayerYouTube2State extends State<VideoPlayerYouTube2> {
  late final YoutubePlayerController _controller = YoutubePlayerController(

    initialVideoId: widget.videoID,

    flags: const YoutubePlayerFlags(
        autoPlay: true,
        forceHD: true,
        hideControls: true
    ),
  );



  @override
  Widget build(BuildContext context) => SafeArea(
    child: RotatedBox(
      quarterTurns: 0,
      child: YoutubePlayerBuilder(

        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: false,
          onReady: () {

            widget.onReady();
            print("---a-a--a-a--a-a-a--a");
          },
          onEnded: (data){
            // Navigator.pop(context);
          },
        ),
        builder: (context, player) => player,
      ),
    ),
  );
}