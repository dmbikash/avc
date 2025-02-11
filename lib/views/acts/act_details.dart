import 'package:flutter/material.dart';

import 'package:avc/components/page_template.dart';
import 'package:avc/theme/textStyles.dart';
import 'package:avc/views/video/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../components/app_variables.dart';
import '../../services/routes.dart';
import '../../theme/colors.dart';
import '../../theme/gap.dart';
import '../video/component/videoPlayer.dart';




class ActDetails extends StatefulWidget {
  var question;

  var answer;

   ActDetails({

    required this.question,
    required this.answer,
    super.key});

  @override
  State<ActDetails> createState() => _ActDetailsState();
}

class _ActDetailsState extends State<ActDetails> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Details",
      children:  [

        Gap.y4 ,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.question, style: ThemeTextStyles.heading,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [

              Expanded(child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                 widget.answer+
                      lorem +"\n"+lorem, style: ThemeTextStyles.values,textAlign: TextAlign.justify,),
              )),
            ],
          ),
        ),
      ],
    );
  }

}

