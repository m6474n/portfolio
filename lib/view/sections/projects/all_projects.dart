import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/projectCard.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/contact_controller.dart';
import 'package:portfolio/controllers/project_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

class AllProjects extends StatefulWidget {
  const AllProjects({super.key});

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
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
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: GetBuilder(
            init: ProjectController(),
            builder: (cont) {
              return SingleChildScrollView(
                child: Column(
                
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: HugeIcon(
                                icon: HugeIcons.strokeRoundedArrowLeft01,
                                color: colorManager.primaryColor,
                                size: 42,
                              )),
                          Text(
                            "Recent Projects",
                            style: TextStyle(
                                color: colorManager.primaryColor, fontSize: 32),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 12,
                          children:
                              List.generate(cont.projects.length, (index) {
                            return Container(
                              // constraints: BoxConstraints(maxWidth: 500),
                              width: 400,
                              height: 250,
                              child: ProjectCard(
                                title: cont.projects[index]['title'],
                                link: cont.projects[index]['link'],
                                description: cont.projects[index]
                                    ['description'],
                                tech: cont.projects[index]['tech'],
                                image: cont.projects[index]['image'],
                              ),
                            );
                          })),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
