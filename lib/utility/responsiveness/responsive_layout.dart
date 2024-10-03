import 'package:flutter/material.dart';
import 'package:portfolio/utility/appsettings.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget desktopView;
  const ResponsiveLayout({super.key, required this.mobileView, required this.desktopView});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth < AppSettings.mobileWidth){
        return mobileView;
      }
      else{
       return desktopView;
      }
    });
  }
}