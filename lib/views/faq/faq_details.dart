import 'package:flutter/material.dart';

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




class FAQDetails extends StatefulWidget {
  var question;

  var answer;

String? image = null;
  FAQDetails({

    required this.question,
    required this.answer,
     this.image = null,
    super.key});

  @override
  State<FAQDetails> createState() => _FAQDetailsState();
}

class _FAQDetailsState extends State<FAQDetails> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Details",
      children:  [
        if(widget.image!=null)Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(widget.image?? "",),
          ),
          
        ),

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

