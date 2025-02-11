import 'package:flutter/material.dart';

class ExpansionStateProvider with ChangeNotifier {
  int? _expandedIndex;

  int? get expandedIndex => _expandedIndex;

  void toggleExpansion(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null;
    } else {
      _expandedIndex = index;
    }
    notifyListeners();
  }
}
