import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String link;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.link,
  });

  @override
  State<SocialIcon> createState() => _SocialIconState();
}
final generalCont=Get.find<GeneralController>();



class _SocialIconState extends State<SocialIcon> {
  Color inactiveColor = generalCont.borderColor;
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        // overlayColor: Colors.transparent,,
        hoverColor: Colors.transparent,
        focusColor:Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onHover: (val) {
          isHover = val;
          setState(() {});
        },
        onTap: () {
          launchUrl(Uri.parse(widget.link));
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: inactiveColor,
              ),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
              child:  Icon(
                      widget.icon,
                      color: !isHover? generalCont.borderColor : generalCont.primaryColor,
                    )),
        ),
      ),
    );
  }
}
