// import 'package:get/get.dart';

// class DashboardController extends GetxController{
//   import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:spider_pos/controllers/database/db_controller.dart';
// import 'package:spider_pos/controllers/home/home_controller.dart';
// import 'package:spider_pos/controllers/settings/setting_controller.dart';
// import 'package:spider_pos/models/store_setting_modal.dart';
// import 'package:spider_pos/models/user_model.dart';
// import 'package:spider_pos/utility/constants.dart';
// import 'package:spider_pos/utility/device_info_helper.dart';
// import 'package:spider_pos/views/auth/login.dart';
// import 'package:spider_pos/views/home/home_screen.dart';
// import 'package:spider_pos/views/menu/menu_screen.dart';
// import 'package:spider_pos/views/reports/report_screen.dart';
// import 'package:spider_pos/views/settings/app_setting_screen.dart';
// import 'package:spider_pos/views/settings/settings.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Dashboardcontroller extends GetxController {
//   final auth = FirebaseAuth.instance;

//   final db = Get.put(DatabaseController());
//   var appInvoiceFooter;
//   getAppInvoiceFooter() async {
//     appInvoiceFooter = await db.getAppInvoiceFooter();
//     update();
//   }

//   final store = Get.put(SettingsController());
//   UserModel? userdetails;
//   final userDataStream = FirebaseFirestore.instance
//       .collection("Users")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .snapshots();
//   StoreSettings? settings;
//   getStoreSettings() async {
//     settings = await store.getStoreSettings();
//     update();
//   }

//   final PageController pageController = PageController();
//   int selectedIndex = 0;
//   bool isTextVisible = true;

//   bool expandSidebar = true;

//   toggleSideBar() {
//     expandSidebar = !expandSidebar;
//     update();
//     if (expandSidebar == true) {
//       Future.delayed(const Duration(milliseconds: 500), () {
//         showSidebarContent = true;
//         update();
//       });
//     } else {
//       showSidebarContent = false;
//     }
//   }

//   bool showSidebarContent = true;

//   List<Widget> screenList = <Widget>[];

//   List<Map<dynamic, dynamic>> sidebarItems = [];

//   List<Widget> tabs = [];

//   void deactivateAllItems() {
//     for (var e in sidebarItems) {
//       e['isActive'] = false;
//     }
//     update();
//   }

//   void onItemTapped(int index) {
//     selectedIndex = index;
//     deactivateAllItems();
//     sidebarItems[index]['isActive'] = true;
//     pageController.jumpToPage(index);
//     // update();
//   }

// // User DEtails
//   Map localOrderCounts = {};
//   getUserDetails() async {
//     userdetails = await db.getUserData();
//     settings = await store.getStoreSettings();

//     await SharedPreferences.getInstance().then((v) async {
//       var sp_id = v.getString('user_id');
//       if (sp_id != null) {
//         if (userdetails!.id == sp_id) {
//           updateSharedPrefsOnLogin(userDetails: userdetails!, v: v);
//         } else {
//           updateSharedPrefsOnLogin(userDetails: userdetails!, v: v);

//           fetchPrefData(userDetails: userdetails!, v: v, settings: settings!);
//         }
//       } else {
//         fetchPrefData(userDetails: userdetails!, v: v, settings: settings!);
//       }
//     });

//     // checkDeviceID(user: userdetails!);

//     update();
//   }

//   fetchPrefData({
//     required UserModel userDetails,
//     required SharedPreferences v,
//     required StoreSettings settings,
//   }) {
//     print(
//         "Fetching Firebase data of ${v.getString('user_id')} user to Shared Prefs....");
//     v.setString('user_id', userdetails!.id);
//     orderCountsKeys.forEach((e) {
//       v.setInt(e, userdetails!.orderCount[e]);
//       update();
//     });
//     v.setString('color', settings.primaryColor);
//   }

//   updateSharedPrefsOnLogin({
//     required UserModel userDetails,
//     required SharedPreferences v,
//   }) async {
//     print("uploading Local data to ${v.getString('user_id')}...");
//     orderCountsKeys.forEach((e) {
//       localOrderCounts[e] = v.getInt(e);
//       update();
//     });
//     await updateOrderCount(localOrderCounts, v.getString('user_id'));
//   }

//   updateOrderCount(counts, id) async {
//     await FirebaseFirestore.instance
//         .collection("Users")
//         .doc(id)
//         .update({"order_count": counts}).then((v) {
//       print("order count updated!");
//     });
//   }

//   getSidebarItems123() {
//     if (userdetails != null) {
//       sidebarItems = globalSidebar[userdetails!.role];
//       sidebarItems = globalSidebar[userdetails!.role];
//       sidebarItems = globalSidebar[userdetails!.role];
//       update();
//     }
//   }

//   getSidebarConfig() async {
//     settings = await store.getStoreSettings();
//     List userMenuItems = settings!.sidebarConfig[userdetails!.role];

//     var index = 0;
//     for (var e in userMenuItems) {
//       Map? config = sidebarConfigs1[e];

//       if (config != null) {
//         sidebarItems.add({
//           'title': config['title'],
//           'icon': config['icon'],
//           'isActive': index == 0
//         });
//         index += 1;
//         screenList.add(config['screen']);

//         // Future.delayed(Duration(seconds: 2), () {
//         //   update();
//         // });
//         // print("////////////////////Sidebar Items: ${sidebarItems}");
//         // print("\\\\\\\\\\\\\\\\\\\\ScreenList: ${screenList}");
//       } else {
//         // print("Config is null for item: $e");
//       }
//     }
//     update();
//   }

//   // Future<void> getUserDetail() async {
//   //   try {
//   //     settings = await store.getStoreSettings();

//   //     var data = getDataFromSharedPrefs();

//   //     update();
//   //   } catch (e) {
//   //     print("Error fetching user details: $e");
//   //   }
//   // }

//   var orderCount = {};
// // Helper method to update order counts
//   // void _updateOrderCounts(SharedPreferences prefs, dynamic userdetails) {
//   //   for (var key in orderCountsKeys) {
//   //     prefs.setInt(
//   //         key, userdetails?.orderCount[key] ?? orderCountPlaceholder[key]);
//   //     orderCount[key] = prefs.getInt(key) ?? 0;
//   //     // print("Updated Order count for $key: ${orderCount[key]}");
//   //   }
//   // }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getUserDetails();
//     getStoreSettings();
//     getSidebarConfig();
//     super.onInit();
//     // Setting true here, because authController login() method was not calling then, and not setting isLogin true
//     // SharedPreferences.getInstance().then((v) {
//     //   print("user is login from dashboard setting is login to true");
//     //   v.setBool("isLogin", true);
//     //   update();
//     // });
//   }
// }

// }