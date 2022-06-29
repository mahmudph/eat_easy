/*
* Created by mahmud on Sun Jun 26 2022
* Email mahmud120398@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

import 'toggle_order_button_widget.dart';

class ToggleOrderActionWidget extends StatefulWidget {
  final VoidCallback? onPressAdd, onPressRemove;
  final int numOfOrder;
  const ToggleOrderActionWidget({
    Key? key,
    this.onPressAdd,
    this.onPressRemove,
    this.numOfOrder = 0,
  }) : super(key: key);

  @override
  State<ToggleOrderActionWidget> createState() =>
      _ToggleOrderActionWidgetState();
}

class _ToggleOrderActionWidgetState extends State<ToggleOrderActionWidget> {
  late ValueNotifier<int> numOfOrder;

  @override
  void initState() {
    super.initState();
    numOfOrder = ValueNotifier<int>(widget.numOfOrder);
  }

  @override
  void dispose() {
    numOfOrder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ToggleOrderButtonWidget(
            icon: Icons.remove,
            iconColor: const Color(0xff8E8EA9),
            backgroundColor: const Color(0xffEAEAEF),
            onTap: () {
              if (numOfOrder.value > 0) {
                numOfOrder.value -= 1;
                if (widget.onPressRemove != null) widget.onPressRemove!();
              }
            },
          ),
          ValueListenableBuilder<int>(
            valueListenable: numOfOrder,
            builder: (_, state, __) {
              return Text(
                state.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Mulish",
                  color: Color(0xff32324D),
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
          ToggleOrderButtonWidget(
            icon: Icons.add,
            iconColor: const Color(0xffFF7B2C),
            backgroundColor: const Color(0xffFFF2EA),
            onTap: () {
              numOfOrder.value += 1;
              if (widget.onPressAdd != null) widget.onPressAdd!();
            },
          ),
        ],
      ),
    );
  }
}
