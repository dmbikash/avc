import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../views/home.dart';

class NoAnimationPageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  NoAnimationPageRouteBuilder({required this.builder})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return builder(context);
    },
    transitionDuration: Duration(milliseconds: 0), // Set duration to 0 for no animation
  );
}

class NoAnimationPageRouteBuilder2<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  final RouteSettings settings;

  NoAnimationPageRouteBuilder2({
    required this.builder,
    required this.settings,
  }) : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return builder(context);
    },
    transitionDuration: Duration(milliseconds: 0),
    settings: settings, // Pass the provided settings
  );
}

Future<void> route(context, className) async {
  // print("click hoise");
  if (kIsWeb) {
    Navigator.push(
      context,
      NoAnimationPageRouteBuilder(
        builder: (context) => className,
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => className,
      ),
    );
  }
}

Future<void> routeNoBack(context, Widget) async {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    return Widget;
  }), (Route<dynamic> route) => false);
}

Future<void> routeNamed(context, classNameString) async {
  // print("click hoise");
  if (kIsWeb) {
    Navigator.pushNamed(context, classNameString);
  } else {
    Navigator.pushNamed(context, classNameString);
  }
}

Future<void> routeNamedAndRemoveAll(context, classNameString) async {
  // print("click hoise");
  Navigator.pushNamedAndRemoveUntil(context, classNameString, (route) => false);
}

String extractClassName(String? url) {
  // unused for now
  try {
    // Split the URL by '#' symbol
    List<String> parts = url?.split('#') ?? [];

    // If there is a class name after '#', return it
    if (parts.length > 1) {
      return parts[1];
    } else {
      throw Exception('No class name found after #');
    }
  } catch (e) {
    // print('Error: $e');
    return "Home";
  }
}

List specials = [
  "ProductManagementSpecial",
  "CustomerManagementSpecial",
  "SalesManagementSpecial",
  "VendorManagementSpecial",
  "OperationManagementSpecial",
];

List productManagement = [
  "ProductManagementSpecial",
  'ProductManagementMenu', // ProductManagementMenu(),
  'Products', // Products(),
  'AddProducts', // AddProducts(),
  'ProductCategory', // ProductCategory(),
  'AddProductCategory', // AddProductCategory(),

  'Inventory', // Inventory(),

  'Unit', // Unit(),
  "AddUnit", // AddUnit(),

  'Brand', // Brand(),
  'AddBrand', // AddBrand(),
];
List customerManagement = [
  "CustomerManagementSpecial",
  'Customers', // Customers(),
  'AddCustomer', // AddCustomer(),
  'CustomerOverview', // CustomerOverview(),
];

List salesManagement = [
  "SalesManagementSpecial",
  'SalesManagementMenu', // SalesManagementMenu(),
  'SalesOrder', // SalesOrder(),
  //'SalesOrderDetails',// OrderDetails(soID,// '',),
  'Invoices', // Invoices(),
  'InvoicesPaymentList', // InvoicesPaymentList(),
  'SalesReport', // SalesReport(),
  'SalesPersonReport', // SalesPersonReport(),
  'SalesOrderShipping', // SalesOrderShipping(),
];

List vendorManagement = [
  "VendorManagementSpecial",
  'VendorManagementMenu', // VendorManagementMenu(),
  'Vendors', // Vendors(),
  'VendorOverview', // VendorOverview(),
  'AddVendors', // AddVendors(),
  'PurchaseOrder', // PurchaseOrder(),
  'Bill', // Bills(),
  'BillPaymentList', // BillPaymentList(),
  'Distributor', // Distributor(),
  'AddDistributor', // AddDistributor(),
];

List operationManagement = [
  "OperationManagementSpecial",
  'OperationManagementMenu', // OperationManagementMenu(),
  'ShippingMethod', // ShippingMethod(),
  'AddShippingMethod', // AddShippingMethod(),

  'PaymentMethod', // PaymentMethod(),
  'AddPaymentMethod', // AddPaymentMethod(),

  'EmployeeManagement', // EmployeeManagement(),
  'Groups', // Groups(),
  'Employees', // Employees(),
  'EmployeeTimeSheet', // EmployeeTimeSheet(),

  'Finance', // Finance(),
  'Income', // Income(),
  'Expense', // Expense(),
  'Payroll', // Payroll(),
  'FixedCost', // FixedCost(),
  'FinanceReport', // FinanceReport(),
  'SearchFinance', // SearchFinance(),
];

List onlineShop = [
  'OnlineShop', // OnlineShop(),
  'CouponCode', // CouponCode(),
  'FreeDelivery', // FreeDelivery(),

  'OfferStatus', // OfferStatus(),
  'OfferBanner', // OfferBanner(),
  'SubBanner', // OfferBanner(),

  'SiteBanner', // SiteBanner(),
  'SocialLink', // SocialLink(),
  'ContactInfo', // ContactInfo(),
  'WordPressSync', // WordPressSync(),
];

List businessSupport = [
  'BusinessSupport', // BusinessSupport(),
  'MarketingSettings', // MarketingSettings(),
  'GoogleAnalysis', // GoogleAnalysis(),
  'Meta', // Meta(),
  'SystemSetting', // SystemSetting(),
  'KnowledgeBase', // KnowledgeBase(),
];

Map routeMap = {
"Home" : Home(),
// "EvacueeRegistrationForm" : EvacueeRegistrationForm(),
// "RegisteredEvacuees" : RegisteredEvacuees(),
// //"Guideline" : Guideline(),
// "Settings" : Settings(),
};
