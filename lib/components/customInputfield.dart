import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/socialIcon.dart';
import 'package:portfolio/controllers/general_controller.dart';

class CustomInput extends StatefulWidget {
  final String title, placeholder;
  final TextEditingController controller;
  final int maxLines;
  const CustomInput({
    super.key,
    required this.title,
    this.maxLines = 1,
    required this.placeholder,
    required this.controller,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}


class _CustomInputState extends State<CustomInput> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.title}",
          style: TextStyle(
              fontSize: 24,
              color: colorManager.textColor,
              fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: colorManager.primaryColor,
          cursorErrorColor: colorManager.primaryColor,
          maxLines: widget.maxLines,
          validator: (value) {
            return value == null || value.isEmpty
                ? "Enter valid ${widget.title}"
                : null;
          },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              hintText: "${widget.placeholder}",
              hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: colorManager.borderColor),
                  border: OutlineInputBorder(borderSide: BorderSide.none))
             
        ),
      ],
    );
  }
}
