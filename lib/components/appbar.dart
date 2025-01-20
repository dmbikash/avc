
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/textStyles.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  final Color backgroundColor;
  final Color textColor = Colors.black;

  // final VoidCallback onMenuTap ;

  final actions;

  PrimaryAppBar({
    super.key,
    required this.title,
    // required this.onMenuTap,
    this.actions,
    this.backgroundColor = ThemeColor.orange,
    this.backButton = true,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            if (backButton) {
              Navigator.pop(context);
            } else {
              Scaffold.of(context).openDrawer();
            }
          },

          //child: Image.asset("asset/appbar/backButton.png"),
          child: backButton ? const Icon(Icons.arrow_back_ios_new_sharp, color: ThemeColor.backGroundColor,) : const Icon(Icons.menu, color: ThemeColor.backGroundColor,)),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: ThemeTextStyles.heading.copyWith(color: ThemeColor.backGroundColor),
      ),
      // actions: actions?? [],
      backgroundColor: backgroundColor,
    );
  }
}
