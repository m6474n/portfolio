// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:portfolio/controllers/auth_controller.dart';
// import 'package:portfolio/controllers/dashboardController.dart';


// class Sidebar extends StatefulWidget {
//   const Sidebar({super.key});

//   @override
//   State<Sidebar> createState() => _SidebarState();
// }

// class _SidebarState extends State<Sidebar> {
//   var authCont = Get.put(AuthController());
//   @override
//   void initState() {
//     super.initState();

//     // Future.delayed((Duration(milliseconds: 400)), () async {
//     //   // Get.put(Dashboardcontroller()).toggleSideBar();
//     //   appDebugSettings = await authCont.getDebugSetting();

//     //   print("appDebugSettings $appDebugSettings");
//     //   print(appDebugSettings['isCleanSharedPrefsEnabled']);
//     //   print(appDebugSettings['isSharedPrefsEnabled']);
//     // });
//   }

//   Map appDebugSettings = {};
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return GetBuilder<DashboardController>(
//       init: DashboardController(),
//       builder: (cont) {
//         return AnimatedContainer(
//           constraints: BoxConstraints(minWidth: cont.expandSidebar ? 200 : 0),
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           height: height,
//           width: cont.expandSidebar ? width * 0.15 : 65, // Adjust sidebar width
//           decoration: BoxDecoration(
//               color: colorManager.bgDark,
//               border: Border(right: BorderSide(color: colorManager.bgLight))),
//           duration: const Duration(milliseconds: 300),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: cont.expandSidebar ? width * 0.15 : 65,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(colorManager.StoreLogo),
//                       fit: BoxFit.contain),
//                 ),
//               ),
//               // SvgPicture.asset(
//               //   'assets/logo.svg',
//               //   height: 100,
//               //   color: colorManager.primaryColor,
//               // ),
//               Divider(
//                 color: colorManager.bgLight,
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: cont.sidebarItems.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         cont.onItemTapped(index);
//                         // Get.delete<SettingsController>();
//                         // Get.put(SettingsController());
//                       },
//                       child: SidebarItem(
//                         title: cont.sidebarItems[index]['title'],
//                         icon: cont.sidebarItems[index]['icon'],
//                         isActive: cont.sidebarItems[index]['isActive'],
//                         isExpanded: cont.expandSidebar,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(0.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     cont.auth.signOut().then((v) async {
//                       SharedPreferences pref =
//                           await SharedPreferences.getInstance();
//                       pref.setBool('isLogin', false);
//                       Get.offAll(() => const LoginScreen());
//                     });
//                   },
//                   child: SidebarItem(
//                     isExpanded: cont.expandSidebar,
//                     title: "Logout",
//                     icon: HugeIcons.strokeRoundedLogout01,
//                     isActive: false,
//                   ),
//                 ),
//               ),

//               (appDebugSettings['isCleanSharedPrefsEnabled'] ?? false)
//                   ? Padding(
//                       padding: const EdgeInsets.all(0.0),
//                       child: GestureDetector(
//                         onTap: () async {
//                           SharedPreferences pref =
//                               await SharedPreferences.getInstance();
//                           pref.setInt('sale', 0);
//                           pref.setInt('sale_return', 0);
//                           pref.setInt('wastage', 0);
//                           pref.setInt('amendment', 0);
//                           pref.setBool('isLogin', false);
//                           Get.offAll(() => const LoginScreen());
//                         },
//                         child: SidebarItem(
//                           isExpanded: cont.expandSidebar,
//                           title: "CleanSP",
//                           icon: HugeIcons.strokeRoundedClean,
//                           isActive: false,
//                         ),
//                       ),
//                     )
//                   : const SizedBox(
//                       height: 5,
//                     ),
//               (appDebugSettings['isSharedPrefsEnabled'] ?? false)
//                   ? Padding(
//                       padding: const EdgeInsets.all(0.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => SharedPreferencesDisplay(),
//                             ),
//                           );
//                         },
//                         child: SidebarItem(
//                           isExpanded: cont.expandSidebar,
//                           title: "AppData",
//                           icon: HugeIcons.strokeRoundedBitcoinDatabase,
//                           isActive: false,
//                         ),
//                       ),
//                     )
//                   : const SizedBox(height: 5),
//               const SizedBox(height: 5),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 12.0),
//                   child: IconButton(
//                     icon: Icon(
//                       cont.expandSidebar
//                           ? Icons.arrow_back_ios_new
//                           : Icons.arrow_forward_ios,
//                       color: colorManager.primaryColor,
//                     ),
//                     onPressed: () {
//                       cont.toggleSideBar();
//                     },
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
