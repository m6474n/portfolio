import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';

class ServiceCard extends StatefulWidget {
  final String title, description;
  final IconData icon;
  final List<String> tech;
  const ServiceCard(
      {super.key,
      required this.title,
      required this.description,
      required this.icon,
      required this.tech});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: width > 500 ? 220 : width,
          height: width > 500 ? 300 : null,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: isHover
                      ? colorManager.primaryColor
                      : colorManager.borderColor),
              borderRadius: BorderRadius.circular(26)),
          child: Padding(
            padding:
                EdgeInsets.only(top: 18.0, left: 12, right: 12, bottom: 12),
            child:
                //  Padding(
                //   padding: const EdgeInsets.only(top:24.0, left: 12, right: 12),
                //   child:

                Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: width>500?CrossAxisAlignment.center: CrossAxisAlignment.start,
              children: [
                if (width > 500)
                  Icon(widget.icon, size: 52, color: colorManager.primaryColor),
                SizedBox(
                  height: 8,
                ),
                width > 500
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 180),
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 22,
                                  height: 1,
                                  fontWeight: FontWeight.w200,
                                  color: colorManager.textColor),
                            ),
                          ),
                          //  Icon(widget.icon, size: 32,color: colorManager.primaryColor),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(widget.icon,
                              size: 72, color: colorManager.primaryColor),
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w200,
                                color: colorManager.textColor),
                          ),
                        ],
                      ),

                SizedBox(
                  height: 6,
                ),
                Text(
                  textAlign: width > 500 ? TextAlign.center : TextAlign.left,
                  widget.description,
                  style: TextStyle(
                      color: colorManager.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 4),
                ),
                // SizedBox(height: 14,),
                // Wrap(
                //   spacing: 4,
                //   runSpacing: 4,
                //   direction: Axis.horizontal,
                //   children: List.generate(widget.tech.length, (index){
                //   return CustomOutlineButton(title: widget.tech[index], onTap: (){});
                // }),)
              ],
            ),
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
