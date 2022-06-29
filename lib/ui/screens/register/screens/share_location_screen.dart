/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterShareLocationScreen extends StatelessWidget {
  const RegisterShareLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderNavWidget(),
              _contentDataWidget(context, size),
              _contentBottomWidget(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentDataWidget(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: SizedBox(
        height: size.height * 0.70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.35,
              child: Image.asset(
                "lib/assets/icons/location.png",
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const HeaderCaptionWidget(
              title: "Share your location\nwith us to order",
              subTitle:
                  "Please enter your location or allow access to your location to find all restaurants that are near you",
            ),
          ],
        ),
      ),
    );
  }

  Widget _contentBottomWidget(BuildContext context, Size size) {
    return Column(
      children: [
        ButtonWidget(
          onPress: () {
            Navigator.pushNamed(
              context,
              Routes.registerSelectLocation,
            );
          },
          title: "Enter a new location",
          buttonColor: Colors.white,
          titleColor: const Color(0xff615793),
        ),
        const SizedBox(height: 10),
        ButtonWidget(
          onPress: () {
            Navigator.pushNamed(
              context,
              Routes.registerSelectLocation,
            );
          },
          title: "Continue",
          buttonColor: const Color(0xff615793),
          titleColor: Colors.white,
        ),
      ],
    );
  }
}
