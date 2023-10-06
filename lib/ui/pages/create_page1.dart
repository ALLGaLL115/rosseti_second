import 'package:flutter/material.dart';
import 'package:rosseti_second/models/models.dart';
import 'package:rosseti_second/ui/pages/pages.dart';

import '../../constants/constants.dart';
import '../../constants/widgets.dart';

class CreatePage1 extends StatefulWidget {
  const CreatePage1({
    super.key,
  });

  @override
  State<CreatePage1> createState() => _CreatePage1State();
}

class _CreatePage1State extends State<CreatePage1> {
  TextEditingController controller = TextEditingController();
  String value = "";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

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
        body: SingleChildScrollView(
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Расскажите о предложении",
                  style: standart,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "Виберите тему и название",
                  style: standart,
                ),
                const SizedBox(
                  height: 35,
                ),
                Globals().topics == []
                    ? Container(
                        height: 58,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 2, color: mainColor)))
                    : GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Scaffold(
                              appBar: AppBar(),
                              body: ListView.builder(
                                  itemCount: Globals().topics.length,
                                  itemBuilder: (context, index) {
                                    var topic =
                                        Globals().topics.elementAt(index);
                                    return GestureDetector(
                                      onTap: () {
                                        value = topic;
                                        setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 50,
                                        margin: const EdgeInsets.all(16),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: mainColor, width: 1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.4),
                                                  blurRadius: 5)
                                            ]),
                                        child: Text(
                                          topic,
                                          style: TextStyle(
                                              color: mainColor, fontSize: 14),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        },
                        child: Container(
                            // height: 58,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 2, color: mainColor)),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 9,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: TextField(
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            hintText: value,
                                            hintStyle: standart,
                                            border: InputBorder.none),
                                        style: standart,
                                      ),
                                    )),
                                Flexible(
                                    flex: 1,
                                    child: Image.asset(
                                        "assets/images/video-player 1.png")),
                              ],
                            )

                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton<String>(
                            //       value: value,
                            //       isExpanded: true,
                            //       style: chatTextStyle,
                            //       icon: Image.asset(
                            //           "assets/images/video-player 1.png"),
                            //       borderRadius: BorderRadius.circular(24),
                            //       items:
                            //           Globals().topics.map(buildMenuItem).toList(),
                            //       onChanged: (value) =>
                            //           setState(() => this.value = value)),
                            // ),
                            ),
                      ),
                const SizedBox(
                  height: 35,
                ),
                InputField(hintText: "Название", controller: controller),
                const SizedBox(
                  height: 188,
                ),
                ContinueButton(
                    onPressed: () {
                      if (value != "" && controller.text.isNotEmpty) {
                        final topicId = Globals().topics.indexOf(value);
                        // var sug = suggestion.copyWith(
                        //     title: controller.text, topicId: topic_id);
                        SendSuggestion.addFrom1(
                            title: controller.text,
                            topic_id: topicId.toString());
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreatePage2(),
                        ));
                      }
                    },
                    text: "Continue"),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
