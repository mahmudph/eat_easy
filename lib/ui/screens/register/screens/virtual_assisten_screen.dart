/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterVirtualAssistenScreen extends StatelessWidget {
  const RegisterVirtualAssistenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.8,
                  child: Stack(
                    children: [
                      Positioned(
                        child: _headerContentImage(context, size),
                      ),
                      Positioned(
                        top: size.height / 2.1,
                        left: 0,
                        right: 0,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: HeaderCaptionWidget(
                            title: "Hello! 👋\nI'm your virtual assistant.",
                            subTitle:
                                "In order to find the best suited choices for you, please answer the next few questions.",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // const Spacer(),
                _bottomWidgetContent(context, size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerContentImage(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.6,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'lib/assets/images/illustration2.png',
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
          left: 16,
          top: 10,
        ),
        child: HeaderNavWidget(),
      ),
    );
  }

  Widget _bottomWidgetContent(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ButtonWidget(
            onPress: () {
              Navigator.pushNamed(
                context,
                Routes.registerVirtualAssis,
              );
            },
            title: "Take me to the menu",
            buttonColor: Colors.white,
            titleColor: const Color(0xff615793),
          ),
          const SizedBox(height: 10),
          ButtonWidget(
            onPress: () {
              Navigator.pushNamed(
                context,
                Routes.registerRecomendation,
              );
            },
            title: "Great, let's start",
            buttonColor: const Color(0xff615793),
            titleColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
