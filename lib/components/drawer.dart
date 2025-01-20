
import 'package:avc/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/drawerprovider.dart';
import '../theme/colors.dart';
import 'buttons.dart';
import 'menu_item.dart';
import '../services/routes.dart';
class CustomDrawer extends StatefulWidget {
  var fromPage;

  CustomDrawer({required this.fromPage, super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(builder: (context, drawerProvider, child) {
      return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ///     ----    LOG0  -----

                  Align(
                //    alignment: Alignment.centerLeft,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: ThemeColor.orange,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 50, bottom: 10),
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      //child: Image.asset("asset/logo/care_logo.png"),
                      child: FlutterLogo(size: 50,),
                    ),
                  ),
                  Align(
                    //    alignment: Alignment.centerLeft,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(

                      ),
                      //width: 110,
                      margin: const EdgeInsets.only(top: 50, bottom: 10, left: 20),
                      child: const Text("Digital Occupancy Counting",style: TextStyle(fontSize: 20),),
                    ),
                  ),



                  menuItem(
                    name: "Home",
                    image_path: "assets/tick.png",
                    useIcon: true,
                    icon: Icons.app_registration,
                    onPressed: () {
                      drawerProvider.addToClickCheckerList("Registration");
                      if (widget.fromPage != "Registration") route(context, Home());
                    },
                    isClicked: drawerProvider.isClicked("Registration"),
                  ),

                ],
              ),
            ),
            const Text("Developped By\nCatch Bangladesh", textAlign: TextAlign.center,),
            if(false)Padding(
              padding: const EdgeInsets.all(8.0),
              child: ThemeButton.expandedButton(
                name: "Log Out",
               //   buttonTextColor: black,
                  onPressed: (){}),
            ),
            SizedBox(height: 5,),
          ],
        ),
      );
    });
  }

  void refresh() {
    setState(() {});
  }
}