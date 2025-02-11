import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_header.dart';
import '../../provider/faq_page_provider.dart';
import '../../theme/colors.dart';
import 'faq_components/faq_topic_page_component.dart';



class FaqTopicPage extends StatefulWidget {
  const FaqTopicPage({super.key});

  @override
  FaqTopicPageState createState() => FaqTopicPageState();
}

class FaqTopicPageState extends State<FaqTopicPage> {
  int selectedIndex = 0;

  void updateSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FaqExpansionStateProvider>(
      create: (_) => FaqExpansionStateProvider(),
      child: Scaffold(
        backgroundColor: ThemeColor.backGroundColor,
        body: Column(
          children: [
            const CustomHeader(
              title: 'Home',
              backButton: false,
            ),
            const SizedBox(height: 16),
            TopicPills(
              selectedIndex: selectedIndex,
              onTabSelected: updateSelectedIndex,
            ),
            Expanded(
              child: TopicContent(selectedIndex: selectedIndex),
            ),
          ],
        ),
      ),
    );
  }
}
