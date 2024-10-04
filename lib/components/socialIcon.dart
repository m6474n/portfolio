import 'package:flutter/material.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/utility/appsettings.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final String link;
 
  const SocialIcon({super.key, required this.icon, required this.link, });

  @override
  State<SocialIcon> createState() => _SocialIconState();
}
Color inactiveColor = AppSettings.borderColor;
class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onHover: (val){
          isHover = val;
         val? setState(() {
                    inactiveColor = AppSettings.grad2;
      
          }):setState(() {

            inactiveColor = AppSettings.borderColor;
          });
          ;
        }
      ,
        onTap: (){
          launchUrl(Uri.parse(widget.link));
          print(widget.link);
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
          child: Center(child: isHover ? CustomMask(child: Icon(widget.icon, color: Colors.white,)):Icon(widget.icon, color: inactiveColor,)),
        ),
      ),
    );
  }
}
