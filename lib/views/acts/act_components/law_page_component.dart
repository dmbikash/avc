import 'package:avc/services/routes.dart';
import 'package:avc/views/acts/file_downloader_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/law_page_provider.dart';
import '../../../theme/colors.dart';
import '../act_details.dart';

class LawPageComponent extends StatelessWidget {
  final List<Map<String, String>> lawItems;

  const LawPageComponent({super.key, required this.lawItems});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpansionStateProvider>(
      builder: (context, expansionState, child) {
        return Scaffold(
          body: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: lawItems.length,
            itemBuilder: (context, index) {
              final bool isExpanded = expansionState.expandedIndex == index;

              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  child: ExpansionTile(
                    key: Key("$index-$isExpanded"),
                    title: Text(
                      lawItems[index]["question"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.primary,
                      ),
                    ),
                    trailing: Icon(
                      isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                      color: ThemeColor.primary,
                    ),
                    initiallyExpanded: isExpanded,
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    collapsedShape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    onExpansionChanged: (expanded) {
                      if (expanded) {
                        expansionState.toggleExpansion(index);
                      } else {
                        if (expansionState.expandedIndex == index) {
                          expansionState.toggleExpansion(index);
                        }
                      }
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          lawItems[index]["answer"]!,
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              route(context, ActDetails(
                                question: lawItems[index]["question"]!,
                                answer: lawItems[index]["answer"]!,
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              textStyle: const TextStyle(fontSize: 14),
                              backgroundColor: ThemeColor.primary,
                              foregroundColor: ThemeColor.white,
                            ),
                            child: const Text("See more"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     route(context, ActsFileDownloadPage());
          //   },
          //   child: const Icon(Icons.download),
          //   backgroundColor: ThemeColor.primary,
          //   foregroundColor: ThemeColor.white,
          // ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        );
      },
    );
  }
}
