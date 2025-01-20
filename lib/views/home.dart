import 'package:avc/components/appbar.dart';
import 'package:flutter/material.dart';

import '../components/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: "Home", backButton: false, ),
    drawer: CustomDrawer(fromPage: "Home",),
    );

  }
}
