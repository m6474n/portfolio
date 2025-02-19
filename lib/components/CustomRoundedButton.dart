import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';

class CustomRoundedButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final bool isRounded;
  final double? fontSize;
  VoidCallback onTap;
  final Color? bgColor, hoverColor;

  CustomRoundedButton({
    super.key,
    required this.label,
    this.icon,
    this.isRounded = false,
    required this.onTap,
    this.fontSize,
    this.bgColor,
    this.hoverColor,
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
      child: InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          print("button pressed");
          widget.onTap();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: !isHover ? Colors.transparent : colorManager.primaryColor,
            ),
            color: !isHover ? colorManager.primaryColor : null,
            borderRadius: widget.isRounded
                ? BorderRadius.circular(36)
                : BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.icon != null
                    ? Icon(
                        widget.icon,
                        color: isHover
                            ? colorManager.primaryColor
                            : colorManager.textColor,
                      )
                    : Container(),
                widget.icon != null ? SizedBox(width: 12) : Container(),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: widget.fontSize ?? 22,
                    color: !isHover
                        ? colorManager.textColor
                        : colorManager.primaryColor,
                  ),
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
