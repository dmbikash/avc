import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  List clickCheckerFlagList = [];

  void addToClickCheckerList(String buttonName) {
    if (clickCheckerFlagList.contains(buttonName)) {
    } else {
      clickCheckerFlagList = [];
      resetSubmenuFlags();
      clickCheckerFlagList.add(buttonName);
      refresh();
    }
  }

  bool isClicked(String buttonName) {
    if (clickCheckerFlagList.contains(buttonName)) {
      return true;
    } else {
      return false;
    }
  }

  void resetSubmenuFlags(){
    showEOD = false;
    showMyProjects = false;
    showMyTickets = false;
    showMyLeaves = false;
    showMyRequisitions = false;
  }

  /// -----  My update

  /// ---- EOD
  //final ExpansionTileController eodController = ExpansionTileController();
  bool showEOD = false;

  void toggleEOD() {
    showEOD = !showEOD;
    clickCheckerFlagList = [];
    refresh();
  }

  /// ---- My Projects
  //final ExpansionTileController eodController = ExpansionTileController();
  bool showMyProjects = false;

  void toggleMyProjects() {
    showMyProjects = !showMyProjects;
    clickCheckerFlagList = [];
    refresh();
  }

  /// ---- My Tickets
  //final ExpansionTileController eodController = ExpansionTileController();
  bool showMyTickets = false;

  void toggleMyTickets() {
    showMyTickets = !showMyTickets;
    clickCheckerFlagList = [];
    refresh();
  }

  /// ---- My Leaves
  //final ExpansionTileController eodController = ExpansionTileController();
  bool showMyLeaves = false;

  void toggleMyLeaves() {
    showMyLeaves = !showMyLeaves;
    clickCheckerFlagList = [];
    refresh();
  }
  /// ---- My Requisitions
  //final ExpansionTileController eodController = ExpansionTileController();
  bool showMyRequisitions= false;

  void toggleMyRequisitions() {
    showMyRequisitions = !showMyRequisitions;
    clickCheckerFlagList = [];
    refresh();
  }

  /// ---- refresh
  void refresh() {
    notifyListeners();
  }
}
