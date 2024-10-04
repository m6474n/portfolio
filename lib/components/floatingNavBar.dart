import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/utility/appsettings.dart';

class FloatingNavbar extends StatelessWidget {
  const FloatingNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppSettings.borderColor),
          borderRadius: BorderRadius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(icon: HugeIcons.strokeRoundedHome01, onTap: () {}),
            CustomIcon(icon: HugeIcons.strokeRoundedUser, onTap: () {}),
            CustomIcon(icon: HugeIcons.strokeRoundedBriefcase01, onTap: () {}),
            CustomIcon(icon: HugeIcons.strokeRoundedListView, onTap: () {}),
            CustomIcon(icon: HugeIcons.strokeRoundedLayers02, onTap: () {}),
            CustomIcon(icon: HugeIcons.strokeRoundedLayout01, onTap: () {}),
            CustomIcon(icon: HugeIcons.strokeRoundedChatting01, onTap: () {}),
            CustomIcon(icon: HugeIcons.strokeRoundedContact, onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CustomIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Icon(
            icon,
            size: 24,
            color: AppSettings.borderColor,
          ),
        ));
  }
}
