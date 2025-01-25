import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';

class SkillCard extends StatefulWidget {
 final String title, icon;
  const SkillCard({super.key, required this.title, required this.icon});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, right: 12),
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color:isHover? colorManager.primaryColor :colorManager.borderColor), borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:  EdgeInsets.all(16),
                child:
              
                Column(children: [
                  SvgPicture.asset(widget.icon, height: 35, color: !isHover? colorManager.borderColor : colorManager.primaryColor,),
                  SizedBox(height: 12,)
      ,                Text(widget.title, style: TextStyle(color: colorManager.textColor),)
                ],),
              ),
        ),
      ),
    );
  }

  onHover(hover) {
    setState(() {
      isHover = hover;
    });
  }
}
