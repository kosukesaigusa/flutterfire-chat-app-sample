import 'package:flutter/material.dart';

/// 1 秒間表示する SnackBar を表示する
void showFloatingSnackBar(BuildContext context, String message, {int seconds = 2}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: seconds),
    ));
}

/// 現在表示している SnackBar を消す
void removeCurrentSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
}
