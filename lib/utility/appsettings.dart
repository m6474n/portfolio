import 'package:flutter/material.dart';

class AppSettings{
// colors
  static Color primaryColor= Color(0xFF00EEFF);
  static Color bgColor= Color(0xff1f1f1f);
  static Color borderColor= Color.fromARGB(255, 119, 119, 119);

  static Color whiteColor= Color(0xFFFFFFFF);
  // static Color grad1= Color(0xFFDB6885);
  // static Color grad2= Color(0xFF972239);
  static Color grad1= Color(0xFF663dff);
  static Color grad2= Color(0xFFcc4499);
  static Gradient primaryGradient = LinearGradient(colors: [grad1,grad2],begin: Alignment.centerLeft, end: Alignment.centerRight);
// sizing
static double mobileWidth = 1220;

}
// Multi Color
// background-color: #663dff;
// background-image: linear-gradient(319deg, #663dff 0%, #aa00ff 37%, #cc4499 100%);
