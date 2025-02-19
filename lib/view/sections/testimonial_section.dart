import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/components/testimonialCard.dart';

import 'package:portfolio/controllers/testimonial_controller.dart';
import 'package:portfolio/models/testimonial.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({super.key});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child: GetBuilder<TestimonialController>(
        init: TestimonialController(),
        builder: (cont) {
          return SingleChildScrollView(
            child: Padding(
          padding:width>500 ? EdgeInsets.symmetric(horizontal: 0):EdgeInsets.only(left: 8, top: 40, right: 8),
          child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  CustomOutlineButton(title: "Testimonials", onTap: () {}),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Trusted By",
                    style: TextStyle(
                        color: colorManager.textColor,
                    fontSize: width >800 ? 54: width *0.1,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 4,
                        height: 1.2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height:width > 500 ?height * 0.4: height *0.6,
                    width:width,
                    child: Column(
                      children: [
                        Expanded(
                          // Use Expanded to ensure PageView takes available space
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: PageView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              controller:cont.testimonialController ,
                              itemCount: cont.testimonials.length,
                              itemBuilder: (context, index) {
                                return TestimonialCard(testimonial: Testimonial.fromJson(cont.testimonials[index]),);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      CircularIconButton(
                        icon: HugeIcons.strokeRoundedArrowLeft01,
                        onTap: () {
                          cont.goBack()
              ;                    },
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      RichText(
                          text: TextSpan(
                              text: '${cont.currentIndex+1}',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: colorManager.primaryColor,
                                  fontWeight: FontWeight.w200),
                              children: [
                            TextSpan(
                              text: ' / ',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: colorManager.textColor,
                                  fontWeight: FontWeight.w200),
                            ),
                            TextSpan(
                              text: '${cont.testimonials.length}',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: colorManager.borderColor,
                                  fontWeight: FontWeight.w400),
                            )
                          ])),
                      SizedBox(
                        width: 18,
                      ),
                      CircularIconButton(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                        onTap: () {
                          cont.goNext()
              ;                    },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CircularIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  State<CircularIconButton> createState() => _CircularIconButtonState();
}

class _CircularIconButtonState extends State<CircularIconButton> {
  onHover(hover) {
    setState(() {
      isHover = hover;
    });
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: isHover
                      ? colorManager.primaryColor
                      : colorManager.borderColor),
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                widget.icon,
                color: isHover
                    ? colorManager.primaryColor
                    : colorManager.borderColor,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
