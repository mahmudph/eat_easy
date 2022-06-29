/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';
import 'list_item_widget.dart';

class ListItemLocationWidget extends StatelessWidget {
  final LocationData data;
  final VoidCallback? onPress;
  final bool isSelected;
  const ListItemLocationWidget({
    Key? key,
    this.isSelected = false,
    required this.data,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListItemWidget(
      child: ListTile(
        contentPadding: const EdgeInsets.all(
          13,
        ).copyWith(
          left: 20,
        ),
        dense: true,
        onTap: onPress,
        title: Text(
          data.title,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Mulish",
            color: Color(0xff212134),
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            data.streat,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Mulish",
              color: Color(0xff8E8EA9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        trailing: SizedBox(
          width: 30,
          height: 30,
          child: Image.asset(
            isSelected
                ? "lib/assets/icons/radio_button_active.png"
                : "lib/assets/icons/radio_button_inactive.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
