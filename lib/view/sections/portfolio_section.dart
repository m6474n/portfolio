import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/projectCard.dart';
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                CustomOutlineButton(title: "Portfolio", onTap: () {}),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Featured Projects",
                  style: TextStyle(
                      color: cont.generalCont.whiteColor,
                      fontSize: 72,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 4,
                      height: 1.2),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height * 0.635,
                  width: width,
                  child: Row(
                    children: [
                      Expanded(
                          child: ProjectCard(
                        title: cont.projects[0]['title'],
                        description: cont.projects[0]['description'],
                        tech: cont.projects[0]['tech'],
                        image: cont.projects[0]['image'],
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          children: [
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
                      )),                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
