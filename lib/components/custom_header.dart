import 'package:avc/components/logo_list.dart';
import 'package:avc/theme/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../theme/colors.dart';

class CustomHeader extends StatefulWidget {
  final String title;
  final bool backButton;
  final Color backgroundColor;
  final Color textColor = Colors.black;

  const CustomHeader(
      {required this.title,
      // required this.onMenuTap,

      this.backgroundColor = ThemeColor.primary,
      this.backButton = true,
      super.key});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.primary,
      child: Column(
        children: [
          SizedBox(height: 30,),
          LogoList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.backButton ?IconButton(onPressed: (){}, icon: Icon(FeatherIcons.arrowLeft,color: ThemeColor.white,)) :  SizedBox(width: 40,),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.title, style: ThemeTextStyles.heading.copyWith(color: ThemeColor.white),),
              ),
              SizedBox(width: 40,),
            ],
          ),
        ],
      ),
    );
  }
}
