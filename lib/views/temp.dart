import 'package:avc/views/video/component/videoPlayer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../services/routes.dart';
import '../theme/border_radius.dart';
import '../theme/gap.dart';
import '../theme/textStyles.dart';

class temp extends StatelessWidget {
   temp({super.key});
String videoID = "asd";
  @override
  Widget build(BuildContext context) {
    return       Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Activating Village Courts",

                maxLines: 1,
                style: ThemeTextStyles.keys,
              ),


              const Text(
                "Activating Village Courts in Bangladesh Phase II (AVCB II) Project facilitates local authorities in making village courts functional at 1,080 unions with financial supports and a tri-partnership with European Union (EU), United Nations Development Programme (UNDP) and the Government of Bangladesh. ",
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ],
          ),
        ),
        Gap.x4,
        Expanded(
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
              child: Image.asset("asset/icon/play.png", width: 44, height: 44),
            ),
          ),
        ),
      ],
    );
  }
}

