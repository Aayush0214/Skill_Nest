import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingDialog {
  static void iOSLoadingDialog(
    BuildContext context, {
    String message = 'Please wait...',
  }) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false, // disable tap outside to close
      builder:
          (_) => PopScope(
            canPop: false, // disables back gesture or button
            child: CupertinoAlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CupertinoActivityIndicator(radius: 14),
                  const SizedBox(height: 12),
                  Text(message),
                ],
              ),
            ),
          ),
    );
  }

  static void androidLoadingDialog(
    BuildContext context, {
    String message = 'Please wait...',
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => PopScope(
            canPop: false,
            child: AlertDialog(
              backgroundColor: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(message, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
