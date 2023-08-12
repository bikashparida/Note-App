import 'package:flutter/material.dart';
import 'package:notes_app/config/theme/theme.dart';

SnackBar customSnackBar(
    {required BuildContext context,
    required String title,
    required String message,
    Color color = Colors.purple}) {
  return SnackBar(
    dismissDirection: DismissDirection.down,
    duration: const Duration(seconds:1),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 10),
    backgroundColor: Colors.transparent,
    elevation: 0,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    content: Container(
      padding: const EdgeInsets.all(20),
      height: 90,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: CustomTheme.labelRegular,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            message,
            style: CustomTheme.labelRegular,
          )
        ],
      ),
    ),
  );
}
