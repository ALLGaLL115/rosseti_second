export 'chat_widgets/chat_card.dart';
export 'chat_widgets/chat_group_separator.dart';
export 'chat_widgets/chat_input.dart';
export 'comon_widgets/continue_button.dart';
export 'projects_widgest/desizion_button.dart';
export 'home_widget.dart';
export 'creatingWidgets/image_widget.dart';
export 'creatingWidgets/input_field_large.dart';
export 'comon_widgets/input_field_with_border.dart';
export 'projects_widgest/project_card.dart';
export 'projects_widgest/projectCheckCard.dart';
export 'projects_widgest/rating.dart';
export 'creatingWidgets/take_photo_button.dart';
export 'creatingWidgets/take_video_button.dart';
export 'creatingWidgets/topics_widget.dart';
export 'creatingWidgets/video_widget.dart';
export 'comon_widgets/input_field.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/pages/home/status_page.dart';

class HeroPage extends StatelessWidget {
  final String heroTag;
  final Image image;
  const HeroPage({
    super.key,
    required this.image,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(tag: heroTag, child: image),
      ),
    );
  }
}

Widget roundedCameraButton({
  required String assetImagePath,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(
        side: BorderSide.none,
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    onPressed: onPressed,
    child: Image.asset(assetImagePath),
  );
}

getActions({
  required BuildContext context,
}) {
  return <Widget>[
    Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => StatusPage(),
            ));
          },
          child: Image.asset(
            "assets/images/image 1.png",
            height: 34,
          ),
        ))
  ];
}

DropdownMenuItem<String> buildMenuItem(String item) {
  return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: standart,
      ));
}

Future pickImage({required ImageSource imageSource}) async {
  final image = await ImagePicker().pickImage(source: imageSource);
  if (image == null) return;

  return image.path;
}

Future pickVideo({required ImageSource imageSource}) async {
  final video = await ImagePicker().pickVideo(source: imageSource);
  if (video == null) return;

  return video.path;
}

Widget projectsOutputs({
  required String title,
  required String description,
}) {
  return Column(
    children: [
      Text(
        title,
        style: standart,
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.withOpacity(0.4),
                    blurStyle: BlurStyle.solid)
              ]),
          child: Text(
            description,
            style: standart,
          )),
    ],
  );
}
