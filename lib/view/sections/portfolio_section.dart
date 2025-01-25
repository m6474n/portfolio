import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/projectCard.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/contact_controller.dart';
import 'package:portfolio/controllers/project_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 0), () {
        setState(() {
          _opacity = 1.0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: GetBuilder(
          init: ProjectController(),
          builder: (cont) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  CustomOutlineButton(title: "Portfolio", onTap: () {}),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Featured Projects",
                        style: TextStyle(
                            color: colorManager.textColor,
                      fontSize: width >800 ? 54: width *0.1,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 4,
                            height: 1.2),
                      ),
                     width>500? Container(child: Row(children: [Text("View More"), HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, color: colorManager.primaryColor)],),):SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: width > 500 ? height * 0.635 :height*1.4,
                    width: width,
                    child: width < 1100
                        ? Column(
                            children: [
                              Expanded(
                                  child: ProjectCard(
                                title: cont.projects[0]['title'],
                                description: cont.projects[0]['description'],
                                tech: cont.projects[0]['tech'],
                                image: cont.projects[0]['image'],
                              )),
                              SizedBox(
                                height: 18,
                              ),
                              Expanded(
                                  child: ProjectCard(
                                title: cont.projects[1]['title'],
                                description: cont.projects[1]['description'],
                                tech: cont.projects[1]['tech'],
                                image: cont.projects[1]['image'],
                              )),
                              SizedBox(
                                height: 18,
                              ),
                              Expanded(
                                  child: ProjectCard(
                                title: cont.projects[2]['title'],
                                description: cont.projects[2]['description'],
                                tech: cont.projects[2]['tech'],
                                image: cont.projects[2]['image'],
                              ))
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(
                                  child: ProjectCard(
                                title: cont.projects[0]['title'],
                                description: cont.projects[0]['description'],
                                tech: cont.projects[0]['tech'],
                                image: cont.projects[0]['image'],
                              )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ProjectCard(
                                        title: cont.projects[1]['title'],
                                        description: cont.projects[1]
                                            ['description'],
                                        tech: cont.projects[1]['tech'],
                                        image: cont.projects[1]['image'],
                                      )),
                                      SizedBox(
                                        height: 18,
                                      ),
                                      Expanded(
                                          child: ProjectCard(
                                        title: cont.projects[2]['title'],
                                        description: cont.projects[2]
                                            ['description'],
                                        tech: cont.projects[2]['tech'],
                                        image: cont.projects[2]['image'],
                                      )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
