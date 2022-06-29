/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'package:flutter/material.dart';
import 'list_item_widget.dart';

class ListItemRecomendationWidget extends StatelessWidget {
  final RecomendationData data;
  final VoidCallback? onPress;
  const ListItemRecomendationWidget({
    Key? key,
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
        subtitle: data.date != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      color: Color(
                        0xffFF7B2C,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    if (data.date != null)
                      Text(
                        data.date!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Mulish",
                          color: Color(0xff8E8EA9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              )
            : null,
        trailing: const SizedBox(
          width: 30,
          height: 30,
          child: Icon(
            Icons.arrow_forward,
            color: Color(0xffFFB01D),
          ),
        ),
      ),
    );
  }
}
