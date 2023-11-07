import 'package:flutter/material.dart';

continueButton({required VoidCallback onTap, required String text}) {
  return ElevatedButton(onPressed: onTap, child: Text(text));
}
