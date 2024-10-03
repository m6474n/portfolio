import 'package:flutter/material.dart';
import 'package:portfolio/components/profileCard.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("D E S K T O P"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Row(children: [
            //  Profile Card (fixed)
            ProfileCard(),
          // Web View
            Expanded(flex: 3,
            child: Column(children: [],))
          
        ],),
      )
    );
  }
}
