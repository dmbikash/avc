import 'package:avc/components/logo_list.dart';

import '../services/routes.dart';
import '../theme/colors.dart';
import '../theme/textStyles.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  var nextPage;

  SplashScreen({required this.nextPage, Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double opacity = 0.0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0; // Set opacity to fully visible
      });
    });

    Future.delayed(Duration(milliseconds: 2000), () {
      route(context, widget.nextPage);
      // routeNamed(context, "Login");
      //checkToken();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ////if(kDebugMode)print(w);
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ThemeColor.primary,
                    ThemeColor.primary,
                    ThemeColor.primary.withOpacity(.85),
                    //ThemeColor.orange.withOpacity(.65),
                    ThemeColor.backGroundColor,
                    //Colors.red,

                    // Color(0xFFFFFFFF),
                    // Color(0xAAFFFFFF),
                    // Color(0x6692278F),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  LogoList(),
                  SizedBox(height: 180,),
                  Text(
                    "আমার আইন",
                    textAlign: TextAlign.center,
                    style: ThemeTextStyles.splashScreen,
                  ),

                  if(false)InkWell(
                    onTap: null,
                    // child: Image.asset(
                    //   "asset/logo/care_logo.png",
                    // ),
                    child: FlutterLogo(size: 50,)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
