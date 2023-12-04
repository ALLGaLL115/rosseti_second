import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/text_styles.dart';
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
        title: Text(
          stringsUi["myStatus"]!,
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
                        Text(stringsUi["silverStatus"]!, style: basicTextStyle),
                        statusTextLine(
                            stringsUi["ratings"]!, '${user.ratingsCount}'),
                        statusTextLine(
                            stringsUi["comments"]!, '${user.commentsCount}'),
                        statusTextLine(
                            stringsUi["offers"]!, '${user.proposalsCount}'),
                        statusTextLine(stringsUi["approved"]!,
                            '${user.acceptedProposalsCount}'),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          "${stringsUi['totalBonuses']!} 1300",
                          // "total bonuses 1300\n",
                          style: basicTextStyle,
                        ),
                        SizedBox(
                          height: 22,
                        ),

                        RichText(
                            maxLines: 5,
                            text: TextSpan(
                              style: basicTextStyle,
                              text:
                                  "${stringsUi['beforeTheGoldenStatusIsStill']} ${user.ratingsCount} ${stringsUi['ratings']!.toLowerCase()} ${stringsUi['or']!.toLowerCase()} ${user.commentsCount} ${stringsUi['comments']} ${stringsUi['or']} ${user.proposalsCount} ${stringsUi['proposal']}",
                            )),
                        // Text(

                        //     style: standart),
                      ]);
                  return child;
                } else {
                  child = const Center(
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
                text: stringsUi["done"]!),
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
          style: basicTextStyle,
        ),
        const Spacer(),
        Text(
          value,
          style: basicTextStyle,
        )
      ],
    );
  }
}
