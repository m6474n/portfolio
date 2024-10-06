import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/testimonialCard.dart';
import 'package:portfolio/controllers/contact_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

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
      child: GetBuilder<ContactController>(
        init: ContactController(),
        builder: (cont) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              CustomOutlineButton(title: "Testimonials", onTap: () {}),
              SizedBox(
                height: 12,
              ),
              Text(
                "Trusted By",
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
                height: height * 0.37,
                width: width * 0.5,
                child: Column(
                  children: [
                    Expanded(
                      // Use Expanded to ensure PageView takes available space
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: PageView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return TestimonialCard();
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
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  RichText(
                      text: TextSpan(
                          text: '1',
                          style: TextStyle(
                              fontSize: 24,
                              color: AppSettings.primaryColor,
                              fontWeight: FontWeight.w200),
                          children: [
                        TextSpan(
                          text: ' / ',
                          style: TextStyle(
                              fontSize: 24,
                              color: AppSettings.whiteColor,
                              fontWeight: FontWeight.w200),
                        ),
                        TextSpan(
                          text: '3',
                          style: TextStyle(
                              fontSize: 18,
                              color: AppSettings.borderColor,
                              fontWeight: FontWeight.w400),
                        )
                      ])),
                  SizedBox(
                    width: 18,
                  ),
                  CircularIconButton(
                    icon: HugeIcons.strokeRoundedArrowRight01,
                    onTap: () {},
                  )
                ],
              )
            ],
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
                      ? AppSettings.primaryColor
                      : AppSettings.borderColor),
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                widget.icon,
                color: isHover
                    ? AppSettings.primaryColor
                    : AppSettings.borderColor,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
