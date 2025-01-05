import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/circularTextButton.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/utility/responsiveness/desktop_view.dart';
import 'package:portfolio/utility/responsiveness/mobile_view.dart';
import 'package:portfolio/utility/responsiveness/responsive_layout.dart';
import 'package:portfolio/view/home.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final generalCont = Get.put(GeneralController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mosen's Portfolio",
      theme: ThemeData(
       fontFamily: 'Inter',
      //  scaffoldBackgroundColor: generalCont.borderColor,
       textTheme: TextTheme(
        // displayLarge: TextStyle(color: generalCont.whiteColor),
        // displayMedium: TextStyle(color: generalCont.whiteColor),
        // displaySmall: TextStyle(color: generalCont.whiteColor),
        // titleLarge: TextStyle(color: generalCont.whiteColor),
        // titleMedium: TextStyle(color: generalCont.whiteColor),
        // titleSmall: TextStyle(color: generalCont.whiteColor),
        // headlineLarge: TextStyle(color: generalCont.whiteColor),
        // headlineMedium: TextStyle(color: generalCont.whiteColor),
        // headlineSmall: TextStyle(color: generalCont.whiteColor),
        // bodyLarge: TextStyle(color: generalCont.whiteColor),
        // bodyMedium: TextStyle(color: generalCont.whiteColor),
        // bodySmall: TextStyle(color: generalCont.whiteColor),
        // labelLarge: TextStyle(color: generalCont.whiteColor),
        // labelMedium: TextStyle(color: generalCont.whiteColor),
        // labelSmall: TextStyle(color: generalCont.whiteColor),
       ),
        // colorScheme: ColorScheme.fromSeed(seedColor: generalCont.primaryColor),
        useMaterial3: true,
      ),
      // home: Home(),
      home:  ResponsiveLayout(mobileView: MobileView(), desktopView: DesktopView())
    );
  }
}
