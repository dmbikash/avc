import 'package:flutter/material.dart';

import 'custom_header.dart';

class PageTemplate extends StatelessWidget {
  List<Widget> children;

  String? pageTitle;

  PageTemplate({
    required this.pageTitle,
    required this.children,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           CustomHeader(
            backButton: false,
            title: pageTitle ?? "",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: children
              ),
            ),
          ),
        ],
      ),
    );
  }
}