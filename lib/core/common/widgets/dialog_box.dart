import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showPlatformDialog(BuildContext context, String title, String message) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    showIOSDialog(context, title, message);
  } else {
    showAndroidDialog(context, title, message);
  }
}

void showIOSDialog(BuildContext context, String title, String message) {
  showCupertinoDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

void showAndroidDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}