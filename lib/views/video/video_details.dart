import 'package:avc/components/page_template.dart';
import 'package:avc/theme/textStyles.dart';
import 'package:avc/views/video/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../components/app_variables.dart';
import '../../services/routes.dart';
import '../../theme/colors.dart';
import '../../theme/gap.dart';

import 'component/videoPlayer.dart';


class VideoDetails extends StatefulWidget {
  const VideoDetails({super.key});

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Details",
      children:  [
         const Row(
          children: [
            Expanded(child: VideoPlayer(videoID: 'JTIZmoxPRp8',)),
          ],
        ),
        Gap.y4 ,
        Text("Activating Village Court", style: ThemeTextStyles.heading,),
        Row(
          children: [

            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '''Activating Village Courts in Bangladesh Phase II (AVCB II) Project facilitates local authorities in making village courts functional at 1,080 unions with financial supports and a tri-partnership with European Union (EU), United Nations Development Programme (UNDP) and the Government of Bangladesh. \n'''
                    + lorem +"\n"+lorem, style: ThemeTextStyles.values,textAlign: TextAlign.justify,),
            )),
          ],
        ),
    ],
    );
  }

}
class playVideoCard extends StatelessWidget {
  const playVideoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeColor.secondary,
            ),
            height: 150,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("asset/images/img.png", fit: BoxFit.cover,),
                ),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: ThemeColor.primary,
                      ),
                      child: IconButton(
                          onPressed: () {
                            route(context, VideoDetails());
                          },
                          icon: Icon(
                            FeatherIcons.play,
                            color: ThemeColor.white,
                          ))),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
