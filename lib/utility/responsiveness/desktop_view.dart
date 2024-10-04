import 'package:flutter/material.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/profileCard.dart';
import 'package:portfolio/utility/appsettings.dart';

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
            SizedBox(width: width*0.08,),
          // Web View
            Expanded(flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 42,),
              CustomOutlineButton(title: "introduction", onTap: (){}),
              SizedBox(height: 32,),
              RichText(text:TextSpan(text: "My self ",style: TextStyle(color: AppSettings.whiteColor, fontSize: 72, fontWeight: FontWeight.w300), children: [TextSpan(text: "Mosen", style: TextStyle(color: AppSettings.primaryColor, fontSize: 72))]))
            ],))
          
        ],),
      )
    );
  }
}
