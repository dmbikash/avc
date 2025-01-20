

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../theme/colors.dart';
import '../theme/textStyles.dart';
import 'app_variables.dart';


Widget menuItem(
    {bool useIcon = false,
      IconData icon = FeatherIcons.feather,
      double iconSize = 25,
      required String name,
      required String image_path,
      required void Function() onPressed,
      required isClicked}) {
  //print(isClicked);
  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: InkWell(
      onTap: onPressed,
      splashColor: ThemeColor.backGroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
        child: Row(
          children: [
            //SvgPicture.asset("asset/home/visit_site.svg",),
            if (useIcon)
              Icon(
                icon,
                color: isClicked ? ThemeColor.orange : ThemeColor.orange,
                //  size: iconSize,
              ),
            if (!useIcon)
              Image.asset(
                image_path,
                width: 25,
              ),
            Padding(
              padding: const EdgeInsets.only(
                left: 22.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 8, bottom: 8, top: 8),
                child: SizedBox(
                  // padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: isClicked ? ThemeTextStyles.label.copyWith(color: ThemeColor.orange) : ThemeTextStyles.normalTitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Theme expandMenuButton({
  required bool isExpanded,
  required String label,
  IconData leadingIcon = FeatherIcons.edit3,
  required VoidCallback refreshMother,
  // required  controller ,
  List<Widget> children = const [ListTile(title: Text('Coming soon'))],
}) {
  // bool isExpanded = expandFlag;
  return Theme(
    data: ThemeData(dividerColor: Colors.transparent, textTheme: appTheme),
    child: ExpansionTile(
      // controller: controller,
      onExpansionChanged: (value) {
        // if (controller.isExpanded) {
        //   controller.collapse();
        // } else {
        //   controller.expand();
        // }
        // print(value);
        isExpanded = value;
        refreshMother();
      },
      initiallyExpanded: isExpanded,
      leading: Icon(
        leadingIcon,
        color: isExpanded ? Colors.black : Colors.black,
      ),

      title: Text(
        label,
        style: TextStyle(color: isExpanded ? Colors.black : Colors.black,),
      ),
      //  tilePadding: EdgeInsets.symmetric(),
      trailing: isExpanded
          ? const Icon(FeatherIcons.chevronDown, color: Colors.black,)
          : const Icon(
        FeatherIcons.chevronRight,
        color: Colors.black,
      ),
      children: children,
    ),
  );
}