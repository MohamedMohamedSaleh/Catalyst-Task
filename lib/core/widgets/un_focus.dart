import 'package:flutter/material.dart';

import '../helpers/functions.dart';


class UnFocus extends StatelessWidget {
  final Widget? child;

  const UnFocus({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();

        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
