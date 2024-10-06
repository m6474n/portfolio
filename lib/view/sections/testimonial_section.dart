import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:portfolio/components/outlineButton.dart';
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
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child: GetBuilder(
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
              SizedBox(height: 20,),
           
            ],
          );
        }
      ),
    );
  }
}
