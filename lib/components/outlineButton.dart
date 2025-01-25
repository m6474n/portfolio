import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback onTap;
   CustomOutlineButton({super.key, required this.title, required this.onTap, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color??colorManager.borderColor),
          borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Text(title, style: TextStyle(color:color?? colorManager.textColor, fontSize: 10),),
      ),
    );
  }
}
