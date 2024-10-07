import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/components/outlineButton.dart';
import 'package:portfolio/utility/appsettings.dart';

class ServiceCard extends StatefulWidget {
  final String title, description;
  final IconData icon;
  final List<String> tech;
  const ServiceCard({super.key, required this.title, required this.description, required this.icon, required this.tech});

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
          
          width: width,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color:isHover ? AppSettings.primaryColor :  AppSettings.borderColor), borderRadius: BorderRadius.circular(32)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
          Text(
                        widget.title,
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w200, color: AppSettings.whiteColor),
                      ) ,
               Icon(widget.icon, size: 42,color: AppSettings.primaryColor),
                 ],
               ),
                SizedBox(height: 6,),
                 Text(
                 widget.description,
                  style: TextStyle(
                  color: AppSettings.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  letterSpacing: 4),
                ), 
                SizedBox(height: 14,),
                Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(widget.tech.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: CustomOutlineButton(title: widget.tech[index], onTap: (){}),
                  );
                }),)
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
