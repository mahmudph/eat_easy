/*
* Created by myonemahmud on Sat Jun 18 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:eat_easy_app/ui/models/models.dart';
import 'package:eat_easy_app/ui/widgets/order_action_widget.dart';
import 'package:eat_easy_app/utils/utils.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// show toast message
  void showToast(
    bool isSuccess, {
    required String message,
    Alignment alignment = Alignment.topCenter,
  }) {
    var duration = const Duration(seconds: 2);
    Toast.show(
      this,
      message,
      duration: duration,
      alignment: alignment,
      borderRadius: BorderRadius.circular(10),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      margin: const EdgeInsets.only(
        top: 35,
      ),
      textStyle: const TextStyle(
        fontFamily: "Mulish",
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }

  Future<void> showLoading(Duration dur) async {
    await AppState.showLoading(
      this,
      dur,
    );
  }

  Future<void> showBottomSheetMenu(
    Widget child,
  ) async {
    await showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: const Color(0xffFCFCFC),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
          ],
        );
      },
    );
  }

  Future<void> showBottomSheetProductDetail(
    Widget child,
    Product product,
  ) async {
    await showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: const Color(0xffFCFCFC),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, controller) {
            return BottomSheetState(
              scrollController: controller,
              child: SizedBox(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ListView(
                        controller: controller,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        children: [
                          child,
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: OrderActionWidget(
                        product: product,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
