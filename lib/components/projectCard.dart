import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/utility/appsettings.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;
  bool showContent = false;
  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;

    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: Container(
       height: height,
        width: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  '../../assets/images/projects/portfolio1.jpg'),
              fit: BoxFit.cover),
          border: Border.all(width: 1, color: AppSettings.borderColor),
          borderRadius: BorderRadius.circular(32)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      height: isHover ? height * 0.235 : 0,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.23), borderRadius: BorderRadius.circular(32)),
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: showContent? SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('DreamHome Finder', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w300, color: AppSettings.whiteColor),),
                              SizedBox(height: 12,),
                              Text('DreamHome Finder is an innovative real estate platform designed to simplify the home buying and selling process.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200, color: AppSettings.whiteColor, letterSpacing: 2),),
                              SizedBox(height: 12,),
                              Row(
                                children: [
                                  CustomOutlineButton(
                                      title: "Figma", onTap: () {})
                                ],
                              ),
                            ],
                          ),
                        ):Container()
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onHover(hover) {
    setState(() {
      isHover = hover;
      if(isHover){
        Future.delayed(Duration(milliseconds: 400,),(){
          showContent = true;
          setState(() {
            
          });
        });
      }else{
        setState(() {
          
        });
        showContent  = false;
      }
    });
  }
}
