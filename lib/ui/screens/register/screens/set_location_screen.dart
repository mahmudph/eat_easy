/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterSetLocationScreen extends StatelessWidget {
  const RegisterSetLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonIconWidget(
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                    const MenuWidget(),
                  ],
                ),
                _contentDataWidget(context, size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentDataWidget(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 8,
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Set your locations 📍",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CardCenterItemWidget(
            pathImage: "lib/assets/icons/qr_code.png",
            onTap: () {
              Navigator.pushNamed(context, Routes.registerShareLocation);
            },
            title: "Scan QR Code",
            description:
                "Choose the simply way, scan your QR Code from our table",
          ),
          CardCenterItemWidget(
            pathImage: "lib/assets/icons/location.png",
            onTap: () {
              Navigator.pushNamed(context, Routes.registerShareLocation);
            },
            title: "Scan QR Code",
            description:
                "If you prefer to add your location manually, here is your option",
          )
        ],
      ),
    );
  }
}
