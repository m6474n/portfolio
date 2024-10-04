import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/components/mask.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/utility/appsettings.dart';

class CustomRoundedButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color? bgColor;
  const CustomRoundedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.bgColor,
  });

  @override
  State<CustomRoundedButton> createState() => _CustomRoundedButtonState();
}

class _CustomRoundedButtonState extends State<CustomRoundedButton> {
  Color inactiveColor = AppSettings.bgColor;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GeneralController(),
      builder: (cont) {
        return InkWell(
          onTap: widget.onTap,
          onHover: (val) {
            setState(() {
              isHover = val;
              inactiveColor = val ? AppSettings.primaryColor : AppSettings.bgColor;
            });
            cont.handleHover(val);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200), // Duration of the animation
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color:isHover? Colors.transparent: AppSettings.grad2),
              gradient: isHover ? AppSettings.primaryGradient : null,
              // color: inactiveColor,
              borderRadius: BorderRadius.circular(36),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              !isHover ?     CustomMask(
                child: Icon(
                      Icons.email_outlined,
                      color: Colors.white
,                      size: 32,
                    ),
              ): Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                    // color: inactiveColor != AppSettings.bgColor
                    //     ? Colors.black
                    //     : AppSettings.primaryColor,
                    size: 32,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                !isHover?  CustomMask(
                  child: Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),
                    ),
                ): Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 22,
                      color: AppSettings.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



// class HoverButtonDemo extends StatefulWidget {
//   @override
//   _HoverButtonDemoState createState() => _HoverButtonDemoState();
// }

// class _HoverButtonDemoState extends State<HoverButtonDemo> {
//   bool _isHovering = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hover Button Demo'),
//       ),
//       body: Center(
//         child: MouseRegion(
//           onEnter: (_) => _onHover(true),
//           onExit: (_) => _onHover(false),
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 200),
//             decoration: BoxDecoration(
//               color: _isHovering ? Colors.blueAccent : Colors.blue,
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: _isHovering
//                   ? [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 1)]
//                   : [],
//             ),
//             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//             child: Text(
//               'Hover Me!',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _onHover(bool hovering) {
//     setState(() {
//       _isHovering = hovering;
//     });
//   }
// }
