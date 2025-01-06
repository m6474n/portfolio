import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/general_controller.dart';

class CustomInputField extends StatefulWidget {
  final String title, placeholder;
  final TextEditingController controller;
  final int maxLines;
  const CustomInputField({
    super.key,
    required this.title,
    this.maxLines = 1,
    required this.placeholder,
    required this.controller,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}


class _CustomInputFieldState extends State<CustomInputField> {

final generalCont = Get.find<GeneralController>();

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
              color: generalCont.whiteColor,
              fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: generalCont.primaryColor,
          cursorErrorColor: generalCont.primaryColor,
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
                  color: generalCont.borderColor),
                  border: OutlineInputBorder(borderSide: BorderSide.none))
             
        ),
      ],
    );
  }
}
