/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:eat_easy_app/utils/utils.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void onSignUpLater(BuildContext context) {
    Storage.instance.isSignUpLater();
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.home,
      (route) => false,
    );
  }

  void signWithFacebookOrGoogle(BuildContext context) async {
    await context.showLoading(const Duration(seconds: 2));

    Storage.instance.setLoginUser();

    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.home,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _headerContentWidget(context, size),
                _bottomFotterContent(context, size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// header content widget
  Widget _headerContentWidget(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeaderCaptionWidget(
            title: "Let's Get Started 😁",
            subTitle:
                "Sign up or login into to have a full digital experience in our restaurant",
          ),
          _contentButtonWidget(context, size),
        ],
      ),
    );
  }

  Widget _contentButtonWidget(BuildContext context, Size size) {
    return Column(
      children: [
        ButtonWidget(
          onPress: () {
            Navigator.pushNamed(context, Routes.registerInputEmail);
          },
          title: "Get Started",
          buttonColor: const Color(0xff615793),
          titleColor: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SparateIndicatorWidget(
            widthSparator: size.width * 0.4,
          ),
        ),
        OutlineButtonWidget(
          onPress: () => signWithFacebookOrGoogle(context),
          buttonColor: Colors.red,
          child: outlineButtonChild(
            context,
            pathIcon: "lib/assets/icons/facebook.png",
            title: "Sign in with Facebook",
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        OutlineButtonWidget(
          onPress: () => signWithFacebookOrGoogle(context),
          buttonColor: Colors.red,
          child: outlineButtonChild(
            context,
            pathIcon: "lib/assets/icons/google.png",
            title: "Sign in with Google",
          ),
        ),
      ],
    );
  }

  Widget outlineButtonChild(
    BuildContext context, {
    required String pathIcon,
    required String title,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: Image.asset(
            pathIcon,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff8E8EA9),
            fontSize: 16,
            fontFamily: "DM Sans",
          ),
        ),
      ],
    );
  }

  /// footer content widget
  Widget _bottomFotterContent(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      child: ButtonWidget(
        onPress: () => onSignUpLater(context),
        title: "Sign up later",
        buttonColor: Colors.white,
        titleColor: const Color(0xff615793),
      ),
    );
  }
}
