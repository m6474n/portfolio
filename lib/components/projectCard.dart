import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/controllers/general_controller.dart';

class ProjectCard extends StatefulWidget {
  final String title, description, image;
  final List<String> tech;
  const ProjectCard(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.tech});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;
  bool showContent = false;
  final generalCont = Get.find<GeneralController>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: Container(
        height: height,
        
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.cover),
            border: Border.all(width: 1, color: generalCont.borderColor),
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
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(32)),
                      child: Padding(
                          padding: EdgeInsets.all(24),
                          child: showContent
                              ? SingleChildScrollView(
                                  // Wrap the Column with SingleChildScrollView
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w300,
                                            color: generalCont.whiteColor),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        widget.description,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200,
                                            color: generalCont.whiteColor,
                                            letterSpacing: 2),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            widget.tech.length, (index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                right: 8, bottom: 8),
                                            child: CustomOutlineButton(
                                                title: widget.tech[index],
                                                onTap: () {}),
                                          );
                                        }),
                                      )
                                    ],
                                  ),
                                )
                              : Container())),
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
      if (isHover) {
        Future.delayed(
            Duration(
              milliseconds: 400,
            ), () {
          showContent = true;
          setState(() {});
        });
      } else {
        setState(() {});
        showContent = false;
      }
    });
  }
}
