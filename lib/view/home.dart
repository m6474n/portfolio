import 'package:flutter/material.dart';
import 'package:portfolio/utility/responsiveness/desktop_view.dart';
import 'package:portfolio/utility/responsiveness/mobile_view.dart';
import 'package:portfolio/utility/responsiveness/responsive_layout.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileView: MobileView(), desktopView: DesktopView());
  }
}