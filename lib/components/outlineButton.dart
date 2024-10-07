import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
   CustomOutlineButton({super.key, required this.title, required this.onTap});
final generalCont = Get.find<GeneralController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: generalCont.borderColor),
          borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Text(title, style: TextStyle(color: generalCont.whiteColor, fontSize: 12),),
      ),
    );
  }
}
