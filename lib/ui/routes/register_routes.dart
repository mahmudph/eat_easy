/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:eat_easy_app/ui/screens/screens.dart';

/// define all routes with the class of the screen
Map<String, WidgetBuilder> routes = {
  Routes.splashscreen: (_) => Splashscreen(),
  Routes.intro: (_) => const IntroScreen(),
  Routes.landing: (_) => const LandingScreen(),
  Routes.registerInputEmail: (_) => const RegisterInputEmail(),
  Routes.registerInputField: (_) => const RegisterInputFormFieldScreen(),
  Routes.registerVeirfyOtp: (_) => const RegisterVerifyOtpScreen(),
  Routes.registerSetLocation: (_) => const RegisterSetLocationScreen(),
  Routes.registerShareLocation: (_) => const RegisterShareLocationScreen(),
  Routes.registerSelectLocation: (_) => const RegisterSelectLocationScreen(),
  Routes.registerPerfectDist: (_) => const RegisterPerfectDistSceeen(),
  Routes.registerVirtualAssis: (_) => const RegisterVirtualAssistenScreen(),
  Routes.registerRecomendation: (_) => const RegisterRecomendationScreen(),
  Routes.registerQuestion: (_) => const RegisterQuestionScreen(),
  Routes.home: (_) => const HomeScreen(),
  Routes.order: (_) => const OrderScreen(),
};
