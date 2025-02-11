import 'package:avc/theme/colors.dart';
import 'package:flutter/material.dart';

class LogoList extends StatelessWidget {
  const LogoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
       height: 80,
        decoration: const BoxDecoration(
            color: ThemeColor.primary,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("asset/logo/Flag_of_Europe.svg.png", width: 50),
                const Text("European \nUnion", textAlign: TextAlign.center,style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: ThemeColor.white),)
              ],
            ),
          ),),
          Expanded(flex: 2,child: Image.asset("asset/logo/Government_Seal_of_Bangladesh.png",height: 60),),
          Expanded(child: Image.asset("asset/logo/UNDP-Logo-Blue-Large-Transparent.png",height: 100,),),
        ],),
      ),
    );
  }
}