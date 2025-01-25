import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:portfolio/components/socialIcon.dart';
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


  void _startAutoScroll() {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_scrollController.hasClients) {
        final double maxScrollExtent =
            _scrollController.position.maxScrollExtent;
        final double currentScrollPosition = _scrollController.position.pixels;

        if (currentScrollPosition < maxScrollExtent) {
          _scrollController
              .animateTo(
                currentScrollPosition + _scrollSpeed,
                duration: Duration(seconds: 1),
                curve: Curves.linear,
              )
              .then((_) => _startAutoScroll());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(42),
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: colorManager.borderColor,
          ),
          borderRadius: BorderRadius.circular(26)),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            width > 500
                ? Row(
                    children: [
                      CircleAvatar(
                          radius: 32,
                          backgroundColor: colorManager.borderColor,
                          child: HugeIcon(
                              icon: HugeIcons.strokeRoundedUser,
                              color: colorManager.textColor)),
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
                                color: colorManager.textColor),
                          ),
                          Text(
                            widget.testimonial.clientCountry,
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: colorManager.borderColor,
                                letterSpacing: 2),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        "${widget.testimonial.clientCompany}",
                        style: TextStyle(
                            fontSize: 24, color: colorManager.primaryColor),
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.testimonial.clientCompany}",
                        style: TextStyle(
                            fontSize: 24, color: colorManager.primaryColor),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 32,
                              backgroundColor: colorManager.borderColor,
                              child: HugeIcon(
                                  icon: HugeIcons.strokeRoundedUser,
                                  color: colorManager.textColor)),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.testimonial.clientName,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: colorManager.textColor),
                              ),
                              Text(
                                widget.testimonial.clientCountry,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: colorManager.borderColor,
                                    letterSpacing: 2),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
            SizedBox(height: 24),
            Text(
              '"${widget.testimonial.message}"',
               textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w200,
                  color: colorManager.textColor,
                  letterSpacing: 2),
            )
          ],
        ),
      ),
    );
  }
}
