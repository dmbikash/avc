import 'package:avc/services/routes.dart';
import 'package:avc/theme/colors.dart';
import 'package:avc/theme/gap.dart';
import 'package:avc/theme/textStyles.dart';
import 'package:avc/views/video/video_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../components/custom_header.dart';

import '../../components/page_template.dart';
import '../../theme/border_radius.dart';
import 'component/videoPlayer.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: 'Video',
      children: const [
        VideoCards(),
        VideoCards(),
        VideoCards(),
        VideoCards(),
        VideoCards(),
      ],
    );
  }
}

class VideoCards extends StatelessWidget {
  const VideoCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String videoID = "JTIZmoxPRp8";
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: (){route(context, VideoDetails());},
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
                color: ThemeColor.secondary,
              ),
              height: 150,
              child:Column(
                children: [
                  Row(children: [
                    Text(
                      "Activating Village Courts",

                      maxLines: 1,
                      style: ThemeTextStyles.keys,
                    ),
                  ],),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          "Activating Village Courts in Bangladesh Phase II (AVCB II) Project facilitates local authorities in making village courts functional at 1,080 unions with financial supports and a tri-partnership with European Union (EU), United Nations Development Programme (UNDP) and the Government of Bangladesh. ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      Gap.x4,
                      Expanded(
                        child: InkWell(
                          onTap: () => route(context, VideoPlayerYouTube(videoID: videoID)),
                          child: Container(
                            alignment: Alignment.center,
                            //width: 300,
                            height: 180 / (16 / 9),
                            decoration: BoxDecoration(
                              borderRadius: ThemeBorderRadius.r2,
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
                  ),
                ],
              )
            ),
          ),
        ),
      ],
    );
  }
  ///
/// Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset("asset/images/img.png"),
//                       ),
//                       Center(
//                         child: IconButton(
//                           onPressed: () {
//                             route(context, VideoDetails());
//                           },
//                           icon: Image.asset(
//                             "asset/icon/play.png",
//                             width: 44,
//                             height: 44,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
///
}
