import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:portfolio/components/CustomRoundedButton.dart';
import 'package:portfolio/components/customInputfield.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/contact_controller.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
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
    double width = MediaQuery.of(context).size
.width;    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(seconds: 1), // Duration of the fade-in animation
      curve: Curves.easeInOut, // Curve for the animation
      child: GetBuilder(
          init: ContactController(),
          builder: (cont) {
            return SingleChildScrollView(
              child: Padding(
          padding:width>500 ? EdgeInsets.symmetric(horizontal: 0):EdgeInsets.only(left: 8, top: 40, right: 8),
          child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    CustomOutlineButton(title: "Contact", onTap: () {}),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Let's Work Together",
                      style: TextStyle(
                          color: colorManager.textColor,
                                        fontSize: width >800 ? 72: width *0.1,
                
                          fontWeight: FontWeight.w200,
                          letterSpacing: 4,
                          height: 1.2),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${cont.email}",
                      style: TextStyle(
                          fontSize:width>500? 32:22,
                          letterSpacing: width > 500 ?5 :2,
                          color: colorManager.textColor,
                          fontWeight: FontWeight.w200),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Form(
                      key: cont.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: CustomInput(
                              title: "Name",
                              placeholder: "Your Full Name",
                              controller: cont.nameController,
                            )),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                                child: CustomInput(
                              title: "Email",
                              placeholder: "Your Valid Email Address",
                              controller: cont.emailController,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomInput(
                              title: "Phone",
                              placeholder: "Your Contact No.",
                              controller: cont.phoneController,
                            )),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                                child: CustomInput(
                              title: "Subject",
                              placeholder: "Your Subject",
                              controller: cont.subjectController,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        CustomInput(
                          title: "Message",
                          placeholder: "Your Message here...",
                          controller: cont.messageController,
                          maxLines: 4,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Align(
                          alignment:  Alignment.bottomLeft,
                          child: Container(
                            width: 250,
                            child: CustomRoundedButton(label: "Submit", onTap: () {
                              if(cont.formKey.currentState!.validate()){
                                cont.sendMessage
                ();                              print('helo');
                              }
                            })),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
