import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosseti_second/strings.dart';

import '../widgets.dart';

Widget takePhotoButton(
    {required BuildContext context,
    required Function(String imagePath) onPressed}) {
  return roundedCameraButton(
    assetImagePath: "assets/images/imagBtn.png",
    onPressed: () => showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                continueButton(
                    onPressed: () async {
                      String _imagePath =
                          await pickImage(imageSource: ImageSource.camera);
                      onPressed(_imagePath);
                      if (!context.mounted) return;
                      Navigator.pop(context);
                    },
                    text: "camera_string"),
                const Text(
                  "or",
                  style: standart,
                ),
                continueButton(
                    onPressed: () async {
                      String _imagePath =
                          await pickImage(imageSource: ImageSource.gallery);
                      onPressed(_imagePath);

                      if (!context.mounted) return;
                      Navigator.pop(context);
                    },
                    text: "galery_string"),
              ],
            ),
          ),
        );
      },
    ),
  );
}
