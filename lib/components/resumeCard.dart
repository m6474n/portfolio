import 'package:flutter/material.dart';
import 'package:portfolio/models/experience.dart';
import 'package:portfolio/utility/appsettings.dart';

class ResumeCard extends StatefulWidget {
  final Experience experience;
  const ResumeCard({super.key, required this.experience});

  @override
  State<ResumeCard> createState() => _ResumeCardState();
}

class _ResumeCardState extends State<ResumeCard> {
  bool isHover  = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_)=> onHover(true),
      onExit: (_)=> onHover(false),
      child: AnimatedContainer(
        duration:const Duration(milliseconds: 400),
        // decoration:
        // BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 12),
              padding: EdgeInsets.only(left: 32),
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(width: 1, color: AppSettings.borderColor)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   widget.experience.time,
                    style: TextStyle(
                        fontSize: 12,
                        color: isHover ? AppSettings.primaryColor : AppSettings.whiteColor,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2),
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  ...List.generate(widget.experience.experience.length, (index){
                    return ReusableExperienceCard(role:widget.experience.experience[index].role,company: widget.experience.experience[index].company,address: widget.experience.experience[index].address,);
                  })
            ,   SizedBox(height: 30,)
                ],
              ),
            ),
            Positioned(
                top: 0,
                left: 8,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:isHover ? AppSettings.primaryColor :AppSettings.borderColor),
                ))
            //
          ],
        ),
      ),
    );
  }

onHover(bool hover){
  setState(() {
    isHover = hover;
  });
}

}

class ReusableExperienceCard extends StatelessWidget {
  final String? role, company, address;
  const ReusableExperienceCard({super.key, this.role, this.company, this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ Text(
                      role??"",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w200,
                        color: AppSettings.whiteColor),
                  ),
                  Text(
                    "${company??""} ${address??""}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppSettings.borderColor, letterSpacing: 3),
                  ),
                  SizedBox(height: 10,),],);
  }
}