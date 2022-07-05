/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:eat_easy_app/utils/utils.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  Splashscreen({Key? key}) : super(key: key) {
    initializeApp();
  }

  void initializeApp() async {
    var navigateOnPassed = Routes.intro;
    var isPassedOnBoaridng = await Storage.instance.isPassedOnboardingApp();
    var isLoginUser = await Storage.instance.isLoginUser();

    /// check if user has already passed on boarding
    /// or application intro
    if (isPassedOnBoaridng) {
      navigateOnPassed = Routes.landing;
    }

    /// check if user is already login to this app
    /// when user is already loged then navigate to home app
    if (isLoginUser) {
      navigateOnPassed = Routes.home;
    }

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamedAndRemoveUntil(
      _globalKey.currentState!.context,
      navigateOnPassed,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Image.asset(
            'lib/assets/images/splashscren.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
