import 'package:avc/services/routes.dart';
import 'package:flutter/material.dart';
import '../../components/custom_header.dart';
import '../../services/url_launcher.dart';
import '../../theme/colors.dart';
import 'motamot_page.dart';


class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom Header
          const CustomHeader(
            backButton: false,
            title: 'প্রতিক্রিয়া',
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Button 1
                  ElevatedButton(
                    onPressed: () {
                      luaunchURL("https://www.undp.org/bangladesh/news/village-courts-end-woes-common-people");
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      backgroundColor: ThemeColor.primary,
                      foregroundColor: ThemeColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ), // Button color
                      textStyle: const TextStyle(fontSize: 20,fontWeight:FontWeight.w500),
                    ),
                    child: const Text('ফরম সমূহ'),
                  ),
                  const SizedBox(height: 20),
                  // Button 2
                  ElevatedButton(
                    onPressed: () {
route(context, MotamotPage());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      backgroundColor: ThemeColor.primary,
                      foregroundColor: ThemeColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('মতামত'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
