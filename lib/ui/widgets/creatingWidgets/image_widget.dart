import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

imageWidget(
    {required BuildContext context,
    required String imagePath,
    required double height,
    required double width,
    required String heroTag}) {
  return GestureDetector(
    onTap: () {
      if (imagePath != "") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HeroPage(
                  heroTag: heroTag,
                  image: Image.file(File(imagePath)),
                )));
      }
    },
    child: Column(
      children: [
        SizedBox(
            height: height,
            width: width,
            child: imagePath == ""
                ? Image.asset(
                    "assets/images/img.png",
                    height: 50,
                  )
                : Hero(tag: heroTag, child: Image.file(File(imagePath)))),
      ],
    ),
  );
}
