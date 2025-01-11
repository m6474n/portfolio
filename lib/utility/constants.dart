// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:intl/intl.dart';

// // formattedDate(input) {
// //   return DateFormat('dd,MM,yyyy').format(input);
// // }

// List<String> globalPaymentTypes = ["cash_paid", "cash_received"];

// String formattedDate(DateTime input) {
//   return DateFormat('dd-MMM-yyyy').format(input); // Format as "12-Jan-2024"
// }

// List<String> availableOrderTypes = [
//   'Sale',
//   'Sale Return',
//   'Wastage',
//   'Amendment'
// ];
// List<String> availableServingTypes = [
//   'Dine In',
//   'Take Away',
//   'Delivery',
// ];
// List<String> orderCountsKeys = ['sale', 'sale_return', 'wastage', 'amendment'];
// Map<String, dynamic> orderCountPlaceholder = {
//   'sale': 0,
//   'sale_return': 0,
//   'wastage': 0,
//   'amendment': 0
// };
// Map<String, dynamic> globalSettingConfig = {'dynamic_invoice_price': false};

// List<String> availableOrderStatus = [
//   'completed',
//   'hold',
//   'cancelled',
// ];
// // Show Ref number
// List<String> orderTypesForRef = ['Sale Return', 'Wastage', 'Amendment'];

// // Available payment types
// List<String> availablePaymentTypes = ["Cash", 'Card', 'Online', 'Credit'];

// Map<String, dynamic> globalSidebar = {
//   "admin": [
//     {'title': 'Home', 'icon': HugeIcons.strokeRoundedHome01, 'isActive': true},
//     {
//       'title': 'Sale',
//       'icon': HugeIcons.strokeRoundedMenuSquare,
//       'isActive': false
//     },
//     {
//       'title': 'Reports',
//       'icon': HugeIcons.strokeRoundedAnalytics02,
//       'isActive': false
//     },
//     {
//       'title': 'Setting',
//       'icon': HugeIcons.strokeRoundedSettings02,
//       'isActive': false
//     },
//   ],
//   "store": [
//     {'title': 'Home', 'icon': HugeIcons.strokeRoundedHome01, 'isActive': true},
//     {
//       'title': 'Sale',
//       'icon': HugeIcons.strokeRoundedMenuSquare,
//       'isActive': false
//     },
//     {
//       'title': 'Reports',
//       'icon': HugeIcons.strokeRoundedAnalytics02,
//       'isActive': false
//     },
//     {
//       'title': 'Setting',
//       'icon': HugeIcons.strokeRoundedSettings02,
//       'isActive': false
//     },
//   ],
//   "till": [
//     {
//       'title': 'Sale',
//       'icon': HugeIcons.strokeRoundedMenuSquare,
//       'isActive': true
//     },
//     {
//       'title': 'Hold invoices',
//       'icon': HugeIcons.strokeRoundedAnalytics02,
//       'isActive': false
//     },
//   ],
// };

// Map<String, dynamic> globalScreenList = {
//   "admin": [
//     const HomeScreen(),
//     const MenuScreen(),
//     const ReportScreen(),
//     const AppSettings()
//   ],
 
// };

// // invoice print color
// // var printColor = const PdfColor.fromInt(0xffdedede);



// String formatTime(DateTime time) {
//   final DateTime dateTime = DateTime(
//     0,
//     0,
//     0,
//     time.hour,
//     time.minute,
//     time.second,
//   );
//   return DateFormat('hh:mm:ss a').format(dateTime); // Format as "12:00:00 AM"
// }

// bool isInteger(String value) {
//   // Try to parse the value as an integer
//   final intValue = int.tryParse(value);
//   return intValue != null;
// }

// prettyPrint(mapData) {
//   var data = const JsonEncoder.withIndent('  ').convert(mapData);
//   print(data);
// }

// String androidAppId = "com.twinspider.darzi_app";
// String iosAppId = "6720752754";

// bool isEmail(String input) {
//   final emailRegex =
//       RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//   return emailRegex.hasMatch(input);
// }

// bool isPhoneNumber(String input) {
//   final phoneRegex = kDebugMode ? RegExp(r'^\d{4,14}$') : RegExp(r'^\d{9,14}$');
//   return phoneRegex.hasMatch(input);
// }

// String capitalize(String input) {
//   if (input.isEmpty) {
//     return input;
//   }
//   return input[0].toUpperCase() + input.substring(1);
// }

// // String encryptPassword(String password) {
// //   final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
// //   final bytes = utf8.encode(hashedPassword);
// //   final base64Encoded = base64.encode(bytes);
// //   return base64Encoded;
// // }

// String capitalizeFullName(String fullName) {
//   if (fullName.isEmpty) {
//     return fullName;
//   }
//   List<String> nameParts = fullName.split(' ');
//   List<String> capitalizedParts = nameParts.map((name) {
//     if (name.isEmpty) {
//       return name;
//     }
//     return name[0].toUpperCase() + name.substring(1).toLowerCase();
//   }).toList();
//   return capitalizedParts.join(' ');
// }

// class Responsive extends StatefulWidget {
//   final Widget child;
//   const Responsive({super.key, required this.child});

//   @override
//   State<Responsive> createState() => _ResponsiveState();
// }

// class _ResponsiveState extends State<Responsive> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       double parentWidth = constraints.maxWidth / 5;
//       const minWidth = 200.0;
//       const maxWidth = 300.0;

//       double childWidth = parentWidth < minWidth
//           ? minWidth
//           : (parentWidth > maxWidth ? maxWidth : parentWidth);

//       return widget.child;
//     });
//   }
// }

// String hexToColor(String hexColor) {
//   String onlyCode = hexColor.substring(1);
//   String color = "0xff$onlyCode";
//   return color;
// }

// String formatKeyToLabel(String key) {
//   if (key.contains("_")) {
//     var words = key.split('_').map((word) {
//       return word[0].toUpperCase() + word.substring(1).toLowerCase();
//     }).join(' ');
//     return words;
//   } else {
//     return key[0].toUpperCase() + key.substring(1).toLowerCase();
//   }
// }

// String toParameterize(String key) {
//   if (key.contains("_")) {
//     var words = key.split('_').map((word) {
//       return word[0].toUpperCase() + word.substring(1).toLowerCase();
//     }).join(' ');
//     return words;
//   } else {
//     return key[0].toUpperCase() + key.substring(1).toLowerCase();
//   }
// }

// String toSnakeCase(String label) {
//   var words = label.split(' ').map((word) => word.toLowerCase()).join('_');
//   return words;
// }

// // ////////// Store Logo
// const String StoreLogo = 'assets/logo-light.png';

// // getDataFromSharedPrefs() async {
// //   print("Getting user details ...");

// //   final prefs = await SharedPreferences.getInstance();
// //   var localUserId = prefs.getString('user_id');
// //   var orderCount = <String, int>{};

// //   orderCountsKeys.forEach((key) {
// //     orderCount[key] = prefs.getInt(key) ?? 0;
// //   });

// //   var data = {'user_id': localUserId, "order_counts": orderCount};
// //   return data;
// // }

// extension DateTimeStartOfDay on DateTime {
//   DateTime get startOfDay {
//     return DateTime(this.year, this.month, this.day);
//   }
// }

// extension DateTimeEndOfDay on DateTime {
//   DateTime get endOfDay {
//     return DateTime(this.year, this.month, this.day, 23, 59, 59, 999);
//   }
// }

// //////////////////
// ///
// Map<String, dynamic> sidebarConfigs = {
//   'home': {
//     'title': 'Home',
//     'icon': HugeIcons.strokeRoundedHome01,
//     'isActive': false,
//     'screen': const HomeScreen()
//   },
//   'sale': {
//     'title': 'Sale',
//     'icon': HugeIcons.strokeRoundedMenuSquare,
//     'isActive': false,
//     'screen': const MenuScreen()
//   },
//   'reports': {
//     'title': 'Reports',
//     'icon': HugeIcons.strokeRoundedAnalytics02,
//     'isActive': false,
//     'screen': const ReportScreen()
//   },
//   'setting': {
//     'title': 'Settings',
//     'icon': HugeIcons.strokeRoundedSettings02,
//     'isActive': false,
//     'screen': const AppSettings()
//   },
//   'customers': {
//     'title': 'Customers',
//     'icon': HugeIcons.strokeRoundedUserAccount,
//     'isActive': false,
//     'screen': CustomerSetting()
//   },
//   'branch_customers': {
//     'title': 'Customers',
//     'icon': HugeIcons.strokeRoundedUserAccount,
//     'isActive': false,
//     'screen': CustomerSetting(role: 'branch')
//   },
//   'payments': {
//     'title': 'Payments',
//     'icon': HugeIcons.strokeRoundedCreditCard,
//     'isActive': false,
//     'screen': PaymentScreen()
//   },
//   'ledger': {
//     'title': 'Ledger',
//     'icon': HugeIcons.strokeRoundedSchoolReportCard,
//     'isActive': false,
//     'screen': LedgerScreen()
//   },
//   'hold_invoices': {
//     'title': 'Hold invoices',
//     'icon': HugeIcons.strokeRoundedAnalytics02,
//     'isActive': false,
//     'screen': ReportScreen(role: 'till')
//   }
// };

// // here you replace current user role
// const userRole = 'till';

// // here you fetch data from store settings of `setting_id`
// const userMenuItems = ['sale', 'hold_invoices'];




// copyToClipboard({String? text}) async {
//   await Clipboard.setData(ClipboardData(text: text ?? ""));
// }

// // showErrorMessage({required String message}) {
// //   EasyLoading.instance.backgroundColor = Colors.red;
// //   EasyLoading.instance.textColor = Colors.white;
// //   EasyLoading.showError(message);
// // }

// // showSuccessMessage({required String message}) {
// //   EasyLoading.instance.backgroundColor = Colors.green;
// //   EasyLoading.instance.textColor = Colors.white;
// //   EasyLoading.showError(message);
// // }

// // showToast({required String message}) {
// //   EasyLoading.instance.backgroundColor = Colors.orange;
// //   EasyLoading.instance.textColor = Colors.white;
// //   EasyLoading.showToast(message);
// // }
