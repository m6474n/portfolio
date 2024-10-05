import 'package:flutter/material.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/utility/appsettings.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(
            height: 100,
          ),
      CustomOutlineButton(title: "Resume", onTap: (){}),
        SizedBox(
            height: 12,
          ),
          Text(
            "Education and Experience",
            style: TextStyle(
                color: AppSettings.whiteColor,
                fontSize: 72,
                fontWeight: FontWeight.w200,
                letterSpacing: 4,
                height: 1.2),
          ),
          
          
    ],);
  }
}