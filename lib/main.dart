import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/circularTextButton.dart';
import 'package:portfolio/utility/appsettings.dart';
import 'package:portfolio/utility/responsiveness/desktop_view.dart';
import 'package:portfolio/utility/responsiveness/mobile_view.dart';
import 'package:portfolio/utility/responsiveness/responsive_layout.dart';
import 'package:portfolio/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mosen's Portfolio",
      theme: ThemeData(
       fontFamily: 'Inter',
       scaffoldBackgroundColor: AppSettings.borderColor,
       textTheme: TextTheme(

        displayLarge: TextStyle(color: AppSettings.whiteColor),
        displayMedium: TextStyle(color: AppSettings.whiteColor),
        displaySmall: TextStyle(color: AppSettings.whiteColor),
        titleLarge: TextStyle(color: AppSettings.whiteColor),
        titleMedium: TextStyle(color: AppSettings.whiteColor),
        titleSmall: TextStyle(color: AppSettings.whiteColor),
        headlineLarge: TextStyle(color: AppSettings.whiteColor),
        headlineMedium: TextStyle(color: AppSettings.whiteColor),
        headlineSmall: TextStyle(color: AppSettings.whiteColor),
        bodyLarge: TextStyle(color: AppSettings.whiteColor),
        bodyMedium: TextStyle(color: AppSettings.whiteColor),
        bodySmall: TextStyle(color: AppSettings.whiteColor),
        labelLarge: TextStyle(color: AppSettings.whiteColor),
        labelMedium: TextStyle(color: AppSettings.whiteColor),
        labelSmall: TextStyle(color: AppSettings.whiteColor),
       ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppSettings.primaryColor),
        useMaterial3: true,
      ),
      // home: Home(),
      home: const ResponsiveLayout(mobileView: MobileView(), desktopView: DesktopView())
    );
  }
}
