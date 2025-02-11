import 'package:avc/services/routes.dart';
import 'package:avc/views/faq/faq_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/faq_page_provider.dart';
import '../../../theme/colors.dart';
import '../faq_json/faq_data.dart';


/// Custom pill-styled tab navigation widget.
class TopicPills extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TopicPills({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 60,
      decoration: BoxDecoration(
        color: ThemeColor.backGroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: faqTopic.length, // Uses your FAQ topics map.
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) => TopicBar(
          index: index,
          isSelected: selectedIndex == index,
          onTap: () => onTabSelected(index),
        ),
      ),
    );
  }
}

/// Single topic tab button.
class TopicBar extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const TopicBar({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
            colors: [ThemeColor.primary, ThemeColor.primary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.transparent,
          border: Border.all(color: ThemeColor.primary, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            // Uses the "topic" from your FAQ topics map.
            faqTopic[index]["topic"] ?? "Untitled",
            style: TextStyle(
              color: isSelected ? ThemeColor.white : ThemeColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
class TopicContent extends StatelessWidget {
  final int selectedIndex;

  const TopicContent({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {


    final List<Map<String, String>> currentFaqs =
    (selectedIndex >= 0 && selectedIndex < faqDataParts.length)
        ? faqDataParts[selectedIndex]
        : faqDataParts[0];

    return Consumer<FaqExpansionStateProvider>(
      builder: (context, expansionState, child) {
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: currentFaqs.length,
          itemBuilder: (context, index) {
            final bool isExpanded = expansionState.expandedIndex == index;
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ExpansionTile(
                key: Key("$index-${currentFaqs[index]["question"]}"),
                title: Text(
                  currentFaqs[index]["question"] ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ThemeColor.primary,
                  ),
                ),
                trailing: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  color: ThemeColor.primary,
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(0),
                ),
                initiallyExpanded: isExpanded,
                tilePadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                childrenPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 4.0),
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
                      currentFaqs[index]["answer"] ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          route(context, FAQDetails(question: currentFaqs[index]["question"] ?? "", answer: currentFaqs[index]["answer"] ?? "",));
                          // Implement "See more" functionality if needed.
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
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
            );
          },
        );
      },
    );
  }
}
