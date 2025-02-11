import 'package:avc/provider/drawerprovider.dart';
import 'package:avc/provider/faq_page_provider.dart';
import 'package:avc/provider/law_page_provider.dart';
import 'package:avc/views/home.dart';
import 'package:avc/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DrawerProvider()),
      ChangeNotifierProvider(create: (_) => ExpansionStateProvider()),
      ChangeNotifierProvider(create: (_) => FaqExpansionStateProvider()),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(nextPage: Home(),),
    );
  }
}

