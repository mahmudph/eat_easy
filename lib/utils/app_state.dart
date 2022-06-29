/*
* Created by myonemahmud on Sun Jun 19 2022
* Email myonemahmud@gmail.com
* Copyright (c) 2022 eat_easy
* Description
*/

import 'package:flutter/material.dart';

class AppState extends StatefulWidget {
  final Widget child;

  const AppState({
    Key? key,
    required this.child,
  }) : super(key: key);

  static Future<T?> showLoading<T>(BuildContext context, Duration dur) {
    return context.findAncestorStateOfType<_AppStateState>()!.showLoading<T>(
          context,
          dur,
        );
  }

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  Future<T?> showLoading<T>(BuildContext context, Duration dur) async {
    var overlayState = Overlay.of(context);

    var overlayEntiry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.black.withOpacity(0.1),
            child: Center(
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Color(0xff615793),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState?.insert(overlayEntiry);

    await Future.delayed(dur);
    overlayEntiry.remove();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
