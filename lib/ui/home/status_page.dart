import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({
    super.key,
  });

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  late Box<User> _userBox;

  @override
  void initState() {
    // TODO: implement initState
    _userBox = Boxes.getUserBox();
    super.initState();
  }

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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/crowns 1.png"),
              // const Text("silver_status", style: standart),
              // statusTextLine("ratings", '${state.user.ratingsCount}'),
              // statusTextLine("comments", '${state.user.commentsCount}'),
              // statusTextLine("offers", '${state.user.proposalsCount}'),
              // statusTextLine(
              //     "approved", '${state.user.acceptedProposalsCount}'),
              // const Text(
              //   "total 1300 bonuses\n",
              //   style: standart,
              // ),
              // Text(

              //     style: standart),
              // const SizedBox(
              //   height: 10,
              // ),
              // continueButton(
              //     onPressed: () {

              //     },
              //     text: "done"),
            ]),
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
