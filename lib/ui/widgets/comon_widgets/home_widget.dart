import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

mainPageWidget({
  required String text,
  required String assetImagePath,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        surfaceTintColor: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(assetImagePath),
            Text(
              text,
              textAlign: TextAlign.center,
              style: standart,
              maxLines: 2,
              softWrap: true,
            ),
          ],
        ),
      ),
    ),
  );
}
