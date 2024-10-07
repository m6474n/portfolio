import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

class CustomRoundedButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final bool isRounded;
  final VoidCallback onTap;
  final Color? bgColor;

  const CustomRoundedButton({
    super.key,
    required this.label,
     this.icon,
     this.isRounded = false,
    required this.onTap,
    this.bgColor,
  });

  @override
  State<CustomRoundedButton> createState() => _CustomRoundedButtonState();
}

class _CustomRoundedButtonState extends State<CustomRoundedButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: !isHover ? Colors.transparent : AppSettings.primaryColor,
            ),
            color: !isHover ? AppSettings.primaryColor : null,
            borderRadius:widget.isRounded? BorderRadius.circular(36):BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              widget.icon != null ?Icon(widget.icon, color: isHover? AppSettings.primaryColor : AppSettings.whiteColor,) :Container(),
            widget.icon!=null?    SizedBox(width: 12) :Container(),
          Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 22,
 color: !isHover? AppSettings.whiteColor : AppSettings.primaryColor,                  ),
                )   
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onHover(bool hover) {
    setState(() {
      isHover = hover;
    });
  }
}
