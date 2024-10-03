import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Scaffold(appBar: AppBar(title: Text("M O B I L E"),),body: Center(child: Text(width.toString()),),);
  }
}