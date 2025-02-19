import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/serviceCard.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/service_controller.dart';
import 'package:portfolio/models/service.dart';
import 'package:portfolio/utility/appsettings.dart';

class ServiceSection extends StatefulWidget {
  const ServiceSection({super.key});

  @override
  State<ServiceSection> createState() => _ServiceSectionState();
}

class _ServiceSectionState extends State<ServiceSection> {
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
    double width = MediaQuery.of(context).size.width
;    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child: GetBuilder(
        init: ServiceController(),
        builder: (cont) {
          return SingleChildScrollView(
            child: Padding(
          padding:width>500 ? EdgeInsets.symmetric(horizontal: 0):EdgeInsets.only(left: 8, top: 40, right: 8),
          child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  CustomOutlineButton(title: "Services", onTap: () {}),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "My Specialization",
                    style: TextStyle(
                        color: colorManager.textColor,
                        // fontSize: 72,
                                          fontSize: width >800 ? 54: width *0.1,
              
                        fontWeight: FontWeight.w200,
                        letterSpacing: 4,
                        height: 1.2),
                  ),
                  SizedBox(height: 20,),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: 
              List.generate(cont.services.length, (index){
                  var service = Service.fromMap(cont.services[index]);
                  return ServiceCard(title: service.title, description: service.description, icon: service.icon, tech: service.tech);
                })
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
