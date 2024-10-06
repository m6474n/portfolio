import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/utility/appsettings.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, right: 12),
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color:isHover? AppSettings.primaryColor :AppSettings.borderColor), borderRadius: BorderRadius.circular(28)),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child:
              
                Column(children: [
                  SvgPicture.asset(widget.icon, height: 50, color: !isHover? AppSettings.borderColor : AppSettings.primaryColor,),
                  SizedBox(height: 12,)
      ,                Text(widget.title)
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
