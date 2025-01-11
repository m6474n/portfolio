import 'package:flutter/material.dart';
import 'package:portfolio/components/socialIcon.dart';

class CustomInputField extends StatefulWidget {
  final String? label, hint;
  final bool enable;
  final FocusNode? focusNode;
  final Widget? suffixIcon, prefixIcon;
  final TextInputType type;
  final bool readOnly;
  final bool isRequired;
  final bool obsecure;
  final double fontSize;

  // final VoidCallback;
  final Function(String)? onChanged;
  VoidCallback? onTap;
  final TextEditingController? controller;

  final int maxLine;
  CustomInputField(
      {super.key,
      this.maxLine = 1,
      this.fontSize = 12,
      this.enable = true,
      this.controller,
      this.obsecure = false,
      this.isRequired = true,
      this.focusNode,
      this.readOnly = false,
      this.type = TextInputType.text,
      this.hint,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.onTap,
      this.label});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  void initState() {
    super.initState();
    // if (widget.controller != null && widget.hint != null) {
    //   widget.controller!.text = widget.hint!;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: GestureDetector(
        onTap: () {
          widget.onTap;
        },
        child: TextFormField(
          style: TextStyle(
              color: colorManager.textColor, fontSize: widget.fontSize),
          obscureText: widget.obsecure,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          onTap: widget.onTap,
          keyboardType: widget.type,
          enabled: widget.enable,
          onChanged: (value) {
            widget.onChanged != null ? widget.onChanged!(value) : null;
          },
          validator: widget.isRequired
              ? (value) {
                  return value == null || value!.isEmpty
                      ? "Field can't be empty!"
                      : null;
                }
              : null,
          controller: widget.controller,
          cursorColor: colorManager.primaryColor,
          maxLines: widget.maxLine,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              labelText: widget.label,
              suffixIcon: widget.suffixIcon,
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w300,
                  height: 0.7,
                  fontSize: widget.fontSize),
              floatingLabelStyle: TextStyle(
                  fontFamily: 'SF Pro',
                  color: colorManager.primaryColor,
                  height: 0.8,
                  fontSize: 12),
              contentPadding: EdgeInsets.only(
                  left: 14, top: widget.maxLine > 1 ? 30 : 12, bottom: 0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorManager.primaryColor),
                  borderRadius: BorderRadius.circular(16)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(16)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(16)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorManager.primaryColor),
                  borderRadius: BorderRadius.circular(16)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorManager.borderColor),
                  borderRadius: BorderRadius.circular(16)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorManager.primaryColor)),
              // label: Text("data"),
              labelStyle: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: widget.fontSize,
                  color: colorManager.primaryColor)),
        ),
      ),
    );
  }
}
