import 'package:flutter/material.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({
    super.key,
  });

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          InputField(onChange: (value) {}),
          const SizedBox(height: 20),
          continueButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MainView(),
                    ),
                    (route) => false);
              },
              text: "done")
        ],
      ),
    )));
  }
}
