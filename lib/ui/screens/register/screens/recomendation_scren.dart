/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/recomendation_data.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterRecomendationScreen extends StatelessWidget {
  const RegisterRecomendationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderNavWidget(),
              _contentDataWidget(context, size),
              const Spacer(),
              _bottomFotterContent(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentDataWidget(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HeaderCaptionWidget(
          title: "It seems like we already know each other 🤝",
          subTitle:
              "You can use the recommendations configured during your last visit to our restaurant or you can have new ones ",
        ),
        SizedBox(
          height: size.height * 0.40,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, i) => const SizedBox(
              height: 24,
            ),
            itemCount: recomendationn.length,
            itemBuilder: (_, i) {
              return ListItemRecomendationWidget(
                data: recomendationn[i],
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    Routes.registerQuestion,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  /// footer content widget
  Widget _bottomFotterContent(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: size.width,
        child: ButtonWidget(
          onPress: () {
            Navigator.pushNamed(context, Routes.registerQuestion);
          },
          title: "Next",
          buttonColor: const Color(0xff615793),
          titleColor: Colors.white,
        ),
      ),
    );
  }
}
