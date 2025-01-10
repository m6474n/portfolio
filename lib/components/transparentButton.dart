import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class TransparentButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final bool isRounded;
  final VoidCallback onTap;
  final Color? bgColor, hoverColor;
  final bool isLoading;

  const TransparentButton({
    super.key,
    required this.label,
     this.icon,
     this.isRounded = false,
    required this.onTap,
    this.bgColor,
    this.hoverColor,
   required this.isLoading,
  });

  @override
  State<TransparentButton> createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
  bool isHover = false;
  final generalCont = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: isHover ? Colors.transparent : generalCont.primaryColor,
            ),
            color: isHover ? generalCont.primaryColor : null,
            borderRadius:widget.isRounded? BorderRadius.circular(36):BorderRadius.circular(12),
          ),
          child: Center(
            child:widget.isLoading? SpinKitWave(color:isHover? Colors.white:generalCont.primaryColor): Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              widget.icon != null ?Icon(widget.icon, color: !isHover? generalCont.primaryColor : generalCont.whiteColor,) :Container(),
            widget.icon!=null?    SizedBox(width: 12) :Container(),
          Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 18,
 color: isHover? generalCont.whiteColor : generalCont.primaryColor,                  ),
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
