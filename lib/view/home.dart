import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/components/socialIcon.dart';



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
          backgroundColor: colorManager.bgColor,
          body: PageView(
                controller: colorManager.pageController,
                scrollDirection:Axis.vertical,
                physics: ScrollPhysics(), 
                children: colorManager.sectionList
              ),);
      
    
     // floatingActionButton: FloatingActionButton(onPressed: (){
      //   String text = "Working with Mohsin has been a fantastic experience. He helped me create a professional website that exceeded my expectations in terms of design, functionality, and attention to detail. From the start, they demonstrated a strong ability to understand my vision and turn it into an attractive and functional site. Communication";
      //   print(text.length);
      // }),
   
  }
}
