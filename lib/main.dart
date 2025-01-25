import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/circularTextButton.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/controllers/theme_controller.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/utility/responsiveness/desktop_view.dart';
import 'package:portfolio/utility/responsiveness/mobile_view.dart';
import 'package:portfolio/utility/responsiveness/responsive_layout.dart';
import 'package:portfolio/view/LoginForm.dart';
import 'package:portfolio/view/home.dart';
import 'package:portfolio/view/sections/projects/all_projects.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  // final colorManager = Get.put(colorManagerroller());
  final ColorManager colorManager = Get.put(ColorManager());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mosen's Portfolio",
      theme: ThemeData(
       fontFamily: 'Inter',
       appBarTheme: AppBarTheme(backgroundColor: colorManager.bgDark, scrolledUnderElevation: 0, elevation: 0),
       scaffoldBackgroundColor: colorManager.bgDark,
       textTheme: TextTheme(
        displayLarge: TextStyle(color: colorManager.textColor),
        displayMedium: TextStyle(color: colorManager.textColor),
        displaySmall: TextStyle(color: colorManager.textColor),
        titleLarge: TextStyle(color: colorManager.textColor),
        titleMedium: TextStyle(color: colorManager.textColor),
        titleSmall: TextStyle(color: colorManager.textColor),
        headlineLarge: TextStyle(color: colorManager.textColor),
        headlineMedium: TextStyle(color: colorManager.textColor),
        headlineSmall: TextStyle(color: colorManager.textColor),
        bodyLarge: TextStyle(color: colorManager.textColor),
        bodyMedium: TextStyle(color: colorManager.textColor),
        bodySmall: TextStyle(color: colorManager.textColor),
        labelLarge: TextStyle(color: colorManager.textColor),
        labelMedium: TextStyle(color: colorManager.textColor),
        labelSmall: TextStyle(color: colorManager.textColor),
       ),
        // colorScheme: ColorScheme.fromSeed(seedColor: colorManager.primaryColor),
        useMaterial3: true,
      ),
      // home: AllProjects(

      // ),
      home:  ResponsiveLayout(mobileView: MobileView(), desktopView: DesktopView())
    );
  }
}
