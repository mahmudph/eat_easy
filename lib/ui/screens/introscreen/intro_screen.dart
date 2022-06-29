/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/
import 'package:flutter/material.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/models/models.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:eat_easy_app/utils/utils.dart';
import 'widgets/intro_page_view_item.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late ValueNotifier<int> currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    currentIndex.dispose();
    super.dispose();
  }

  void onSignUpLater() {
    Storage.instance.setSignUpLater();
    Navigator.of(context).pushNamedAndRemoveUntil(
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
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                _contentIntroScreen(context, size),
                _indicatorActive(context, size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentIntroScreen(BuildContext context, Size size) {
    return Positioned.fill(
      bottom: 16,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _scolHeaderWidgetContent(
              context,
              size,
            ),
            _bottomContentWidget(
              context,
              size,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomContentWidget(BuildContext context, Size size) {
    return Column(
      children: [
        ButtonWidget(
          onPress: onSignUpLater,
          title: "Sign up later",
          buttonColor: Colors.white,
          titleColor: const Color(0xff615793),
        ),
        const SizedBox(height: 10),
        ButtonWidget(
          onPress: () {
            Storage.instance.setPassedOnBoardingApp();
            Navigator.pushNamed(context, Routes.landing);
          },
          title: "Get Started",
          buttonColor: const Color(0xff615793),
          titleColor: Colors.white,
        ),
      ],
    );
  }

  /// scoll page content
  Widget _scolHeaderWidgetContent(BuildContext context, Size size) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.75,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: introPage.length,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          currentIndex.value = index;
        },
        itemBuilder: (_, index) {
          return IntroPageViewItem(
            data: introPage[index],
          );
        },
      ),
    );
  }

  Widget _indicatorActive(BuildContext context, Size size) {
    return Positioned(
      top: size.height * 0.65,
      left: 0,
      right: 0,
      child: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (_, curIndex, __) {
            return IndicatorPageViewWidget(
              currentPage: curIndex,
              pageLength: introPage.length,
            );
          },
        ),
      ),
    );
  }
}
