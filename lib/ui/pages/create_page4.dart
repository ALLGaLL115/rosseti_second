import 'package:flutter/material.dart';
import 'package:rosseti_second/constants/widgets.dart';
import 'package:rosseti_second/data/models/models.dart';
import 'package:rosseti_second/ui/pages/pages.dart';

import '../../constants/constants.dart';
import '../../data/data_providers.dart';

class CreatePage4 extends StatefulWidget {
  const CreatePage4({
    super.key,
  });

  @override
  State<CreatePage4> createState() => _CreatePage4State();
}

class _CreatePage4State extends State<CreatePage4> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text("Создать"),
            actions: getActions(context: context),
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 141, left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Расскажите как надо",
                    style: standart,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: mainColor, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      minLines: 10,
                      maxLines: 10,
                      controller: controller,
                      style: chatTextStyle,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  const Text(
                    "Добавьте фото или видео",
                    style: standart,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  continueButton(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          SendSuggestion.addFrom4(
                              positive_effect: controller.text);

                          DataProviders.sendSuggestionByMultipard();

                          if (!context.mounted) return;
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
                              ),
                              (route) => false);
                          SendSuggestion.empty();
                        }
                      },
                      text: "Continue")
                ],
              ),
            ),
          ),
        )));
  }
}
