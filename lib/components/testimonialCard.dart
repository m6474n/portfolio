import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utility/appsettings.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                              padding: EdgeInsets.all(42),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppSettings.borderColor),
                                  borderRadius: BorderRadius.circular(32)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 32,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name Of Cliend",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w300,
                                                color: AppSettings.whiteColor),
                                          ),
                                          Text(
                                            "Company Name",
                                             style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: AppSettings.borderColor, letterSpacing: 2),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  Text(
                                      '"kcsa coa cjns cijasncks cnj sac kascjsb vc sa clksa mckpsnckjs akn clsdc ksa cls cksd cs cls kc ,s ckns chdsv hcbsjobfhdsvgc0us ejwnv-o rojbuwhfk cbdsvasld cjs kb sc sdvm,lns."', style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w200,
                                                color: AppSettings.whiteColor, letterSpacing: 2),
                                      )
                                ],
                              ),
                            );
  }
}