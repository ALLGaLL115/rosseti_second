import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

desizionButton({required Function() onAgree, required Function() onDisagree}) {
  return Row(
    children: [
      Flexible(
          child: SizedBox(
        height: 58,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: mainColor, foregroundColor: Colors.white),
            onPressed: onAgree,
            child: const Icon(Icons.add)),
      )),
      const SizedBox(
        width: 8,
      ),
      Flexible(
        child: SizedBox(
          height: 58,
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, foregroundColor: mainColor),
              onPressed: onDisagree,
              child: const RotationTransition(
                  turns: AlwaysStoppedAnimation(45 / 360),
                  child: Icon(
                    Icons.add,
                  ))),
        ),
      )
    ],
  );
}
