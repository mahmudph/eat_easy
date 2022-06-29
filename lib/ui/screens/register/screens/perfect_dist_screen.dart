/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterPerfectDistSceeen extends StatelessWidget {
  const RegisterPerfectDistSceeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _haderContentWidget(context, size),
              _dataContentWidget(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _haderContentWidget(BuildContext context, Size size) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(
                'lib/assets/icons/location_point.png',
                fit: BoxFit.contain,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Gram Bistro",
                style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 16,
                  color: Color(0xff8E8EA9),
                ),
              ),
            ),
            const Spacer(),
            const MenuWidget()
          ],
        ),
      ],
    );
  }

  Widget _dataContentWidget(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Lets find the perfect dish for\nyou",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'DM Sans',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff32324D),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          CardPrefectDistWidget(
            pathImageIcon: "lib/assets/icons/lamp.png",
            title: "Choose Virtual Assistant",
            description: "Simplify your decisions through our Smart Menu",
            onPress: () {
              Navigator.pushNamed(
                context,
                Routes.registerVirtualAssis,
              );
            },
          ),
          CardPrefectDistWidget(
            pathImageIcon: "lib/assets/icons/book.png",
            title: "Go to the menu",
            description:
                "If you already know what to order, this is the best choice",
            onPress: () {
              Navigator.pushNamed(
                context,
                Routes.registerVirtualAssis,
              );
            },
          )
        ],
      ),
    );
  }
}
