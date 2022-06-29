/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/extensions/context_extension.dart';
import 'package:eat_easy_app/ui/models/models.dart';
import 'package:eat_easy_app/ui/routes/routes.dart';
import 'package:eat_easy_app/ui/widgets/list_item_location_widget.dart';
import 'package:eat_easy_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegisterSelectLocationScreen extends StatefulWidget {
  const RegisterSelectLocationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterSelectLocationScreen> createState() =>
      _RegisterSelectLocationScreenState();
}

class _RegisterSelectLocationScreenState
    extends State<RegisterSelectLocationScreen> {
  late ValueNotifier<int> indexSelected;
  late ValueNotifier<bool> isSelectedIndex;

  @override
  void initState() {
    super.initState();
    indexSelected = ValueNotifier<int>(0);
    isSelectedIndex = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    indexSelected.dispose();
    isSelectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F8F8),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HeaderNavWidget(),
              _contentDataWidget(context, size),
              _contentListWidget(context, size),
              _contentButtonWidget(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentDataWidget(BuildContext context, Size size) {
    return const HeaderCaptionWidget(
      title: "Share your location with us to order",
      subTitle:
          "Please enter your location or allow access to your location to find all restaurants that are near you",
    );
  }

  Widget _contentListWidget(BuildContext context, Size size) {
    return SizedBox(
      height: size.height * 0.5,
      child: ListView.separated(
        itemBuilder: (_, i) {
          return ValueNotifierBuilder2<int, bool>(
            listenable1: indexSelected,
            listenable2: isSelectedIndex,
            builder: (_, index, isSelected, __) {
              return ListItemLocationWidget(
                isSelected: isSelected ? index == i : false,
                data: locationData[i],
                onPress: () {
                  indexSelected.value = i;
                  isSelectedIndex.value = true;
                },
              );
            },
          );
        },
        separatorBuilder: (_, i) {
          if (i != locationData.length - 1) {
            return const SizedBox(
              height: 24,
            );
          }
          return const Opacity(
            opacity: 0,
          );
        },
        itemCount: locationData.length,
      ),
    );
  }

  Widget _contentButtonWidget(BuildContext context, Size size) {
    return SizedBox(
      width: size.width,
      child: ButtonWidget(
        onPress: () {
          if (isSelectedIndex.value) {
            Navigator.pushNamed(context, Routes.registerPerfectDist);
            return;
          }
          context.showToast(
            false,
            message: "Please select a location to continue",
          );
        },
        title: "Next",
        buttonColor: const Color(0xff615793),
        titleColor: Colors.white,
      ),
    );
  }
}
