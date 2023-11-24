import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/comon_widgets/continue_button.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({
    super.key,
  });

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text(
          "my_status",
          style: standart,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/image 1.png",
              height: 34,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: Boxes.getUserBox().listenable(),
              builder: (context, box, child) {
                if (box.isNotEmpty) {
                  final user = box.values.single;

                  child = Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/crowns 1.png"),
                        const Text("silver_status", style: standart),
                        statusTextLine("ratings", '${user.ratingsCount}'),
                        statusTextLine("comments", '${user.commentsCount}'),
                        statusTextLine("offers", '${user.proposalsCount}'),
                        statusTextLine(
                            "approved", '${user.acceptedProposalsCount}'),
                        const Text(
                          "total 1300 bonuses\n",
                          style: standart,
                        ),

                        RichText(
                            maxLines: 5,
                            text: TextSpan(
                                text:
                                    "До золотого статуса ещё ${user.ratingsCount} оценок или ${user.commentsCount} коментариев или ${user.proposalsCount} предложение")),
                        // Text(

                        //     style: standart),
                      ]);
                  return child;
                } else {
                  child = Center(
                    child: CircularProgressIndicator(),
                  );
                  return child;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            continueButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: "done"),
          ],
        ),
      ),
    ));
  }

  Row statusTextLine(String text, String value) {
    return Row(
      children: [
        Text(
          text,
          style: standart,
        ),
        const Spacer(),
        Text(
          value,
          style: standart,
        )
      ],
    );
  }
}
