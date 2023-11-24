import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

imageWidget(
    {required BuildContext context,
    required String imagePath,
    required double height,
    required double width}) {
  return GestureDetector(
    onTap: () {
      if (imagePath != "") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HeroPage(
                  heroTag: exetingHero,
                  image: Image.file(File(imagePath)),
                )));
      }
    },
    child: SizedBox(
        height: height,
        width: width,
        child: imagePath == ""
            ? Image.asset(
                "assets/images/img.png",
                height: 50,
              )
            : Hero(tag: exetingHero, child: Image.file(File(imagePath)))),
  );
}
