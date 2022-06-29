/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/intro_page_data.dart';
import 'package:flutter/material.dart';

class IntroPageViewItem extends StatelessWidget {
  final IntroPageData data;

  const IntroPageViewItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.60,
            child: Image.asset(
              data.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: size.height * 0.08,
          ),
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontFamily: "DM Sans",
                  fontSize: 26,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontFamily: "Muhim",
                  fontSize: 16,
                  color: const Color(0xff8E8EA9),
                ),
          ),
        ],
      ),
    );
  }
}
