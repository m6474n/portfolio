import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/view/sections/hero_section.dart';


class Home extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: PageView(
        controller: _pageController,
        scrollDirection:Axis.vertical,
        physics: PageScrollPhysics(), // This ensures the snapping effect
        children: <Widget>[
         HeroSection(),
          Container(
            color: Colors.green,
            child: Center(child: Text('Page 2', style: TextStyle(fontSize: 24, color: Colors.white))),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('Page 3', style: TextStyle(fontSize: 24, color: Colors.white))),
          ),
        ],
      ),
    );
  }
}
