import 'package:flutter/material.dart';
import 'package:rosseti_second/constants/constants.dart';
import 'package:rosseti_second/models/models.dart';

class StatusPage extends StatefulWidget {
  final Author user;
  const StatusPage({super.key, required this.user});

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
            "Мой статус",
            style: appbarTextStyle,
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/crowns 1.png"),
                const Text('Серебрянный статус ', style: standart),
                statusTextLine('Оценок', '${widget.user.ratingsCount}'),
                statusTextLine('Комментариев', '${widget.user.commentsCount}'),
                statusTextLine('Предложений', '${widget.user.proposalsCount}'),
                statusTextLine(
                    'Одобрено', '${widget.user.acceptedProposalsCount}'),
                const Text(
                  "Итого 1300 бонусов\n",
                  style: standart,
                ),
                Text(
                    "До золотого статуса\nеще ${45 - widget.user.ratingsCount!} оценок или\n ${31 - widget.user.commentsCount!} комментариев\nили ${2 - widget.user.acceptedProposalsCount!} предложение",
                    style: standart),
                const SizedBox(
                  height: 10,
                ),
                ContinueButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: "Готово"),
              ]),
        ),
      ),
    );
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
