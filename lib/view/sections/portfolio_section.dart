import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
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
                      color: AppSettings.whiteColor,
                      fontSize: 72,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 4,
                      height: 1.2),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height *0.635,
                  width:width ,
                  child: Row(
                    children: [
                      Expanded(child: ProjectCard()),
                      Padding(
                        padding: const EdgeInsets.only(left:18.0),
                        child: Column(
                          children: [
                            Expanded(child: ProjectCard()),
                            SizedBox(height: 18,),
                            Expanded(child: ProjectCard()),
                          ],
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
