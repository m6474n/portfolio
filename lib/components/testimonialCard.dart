import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/controllers/general_controller.dart';
import 'package:portfolio/models/testimonial.dart';

class TestimonialCard extends StatefulWidget {
  final Testimonial testimonial;
  const TestimonialCard({super.key, required this.testimonial});

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
   final ScrollController _scrollController = ScrollController();
  final double _scrollSpeed = 50.0; // Pixels per second

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }
  final generalCont = Get.find<GeneralController>();

  void _startAutoScroll() {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_scrollController.hasClients) {
        final double maxScrollExtent = _scrollController.position.maxScrollExtent;
        final double currentScrollPosition = _scrollController.position.pixels;

        if (currentScrollPosition < maxScrollExtent) {
          _scrollController.animateTo(
            currentScrollPosition + _scrollSpeed,
            duration: Duration(seconds: 1),
            curve: Curves.linear,
          ).then((_) => _startAutoScroll());
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
  
    return Container(
          padding: EdgeInsets.all(42),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: generalCont.borderColor,
          ),
          borderRadius: BorderRadius.circular(32)),
    child:  SingleChildScrollView(
            controller: _scrollController,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 32,
                    backgroundColor: generalCont.borderColor,
                    child: HugeIcon(
                        icon: HugeIcons.strokeRoundedUser,
                        color: generalCont.whiteColor)),
                SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.testimonial.clientName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: generalCont.whiteColor),
                    ),
                    Text(
                      widget.testimonial.clientCountry,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: generalCont.borderColor,
                          letterSpacing: 2),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "${widget.testimonial.clientCompany}",
                  style: TextStyle(
                      fontSize: 24, color: generalCont.primaryColor),
                )
              ],
            ),
            SizedBox(height: 24),
          
             
                  Text(
                    '"${widget.testimonial.message}"',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w200,
                        color: generalCont.whiteColor,
                        letterSpacing: 2),
                  )
          ],
        ),
      ),
    );
  }
}
