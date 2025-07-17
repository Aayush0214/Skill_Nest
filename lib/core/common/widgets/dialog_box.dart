import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showPlatformDialog(BuildContext context, String title, String message) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    showIOSDialog(context, title, message, () {});
  } else {
    showAndroidDialog(context, title, message, () {});
  }
}

void showIOSDialog(
  BuildContext context,
  String title,
  String message,
  void Function()? onTap,
) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: false,
    builder:
        (_) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(onPressed: onTap, child: const Text('OK')),
          ],
        ),
  );
}

void showAndroidDialog(
  BuildContext context,
  String title,
  String message,
  void Function()? onTap,
) {
  showDialog(
    context: context,
    builder:
        (_) => AlertDialog(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(title, textAlign: TextAlign.center),
          content: Text(message, textAlign: TextAlign.center),
          contentPadding: EdgeInsets.all(5),
          actions: [TextButton(onPressed: onTap, child: const Text('OK'))],
        ),
  );
}

Future<void> showLogoutConfirmationDialog({
  String subTitle = '',
  required String title,
  required BuildContext context,
  required void Function() onConfirm,
}) async {
  await showCupertinoDialog(
    context: context,
    builder:
        (_) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(subTitle),
          actions: [
            CupertinoDialogAction(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: onConfirm,
              child: Text("Confirm"),
            ),
          ],
        ),
  );
}
