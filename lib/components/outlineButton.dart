import 'package:flutter/material.dart';
import 'package:portfolio/utility/appsettings.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomOutlineButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppSettings.borderColor),
          borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: Text(title, style: TextStyle(color: AppSettings.whiteColor, fontSize: 12),),
      ),
    );
  }
}
