// ignore_for_file: file_names
import 'package:calera/styles/colors.dart';
import 'package:flutter/material.dart';

void warningMessage({
  required bool alert,
  required String res,
  required BuildContext context,
}) {
  final border = alert ? redTransparent : btnblue;
  final background = alert ? redTransparent : blue;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        res,
        style: const TextStyle(
            fontSize: 13, color: white, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      backgroundColor: background,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: border),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
    ),
  );
}
