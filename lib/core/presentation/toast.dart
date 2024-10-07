import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

Future<void> showNoConnectionToast(
  String message,
  BuildContext context,
) async {
  await context.showToast(
    Text(
      message,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Colors.black.withOpacity(0.7),
    // borderRadius: BorderRadius.circular(8),
    margin: const EdgeInsets.all(8),
  );
}
