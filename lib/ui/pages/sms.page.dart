import 'package:flutter/material.dart';
import 'package:rosseti_second/constants/constants.dart';
import 'package:rosseti_second/ui/pages/pages.dart';

import '../../data/data_providers.dart';

// class SmsPage extends StatelessWidget {
//   final String code;
//   final String phone;
//   const SmsPage({
//     super.key,
//     required this.code,
//     required this.phone,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SmsView(phone: phone, code: code);
//   }
// }

class SmsPage extends StatefulWidget {
  final String code;
  final String phone;
  const SmsPage({
    super.key,
    required this.code,
    required this.phone,
  });

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
          inputField(hintText: "Код из СМС", controller: controller),
          const SizedBox(height: 20),
          continueButton(
              onPressed: () async {
                if (controller.text == widget.code) {
                  FocusScope.of(context).unfocus();
                  await DataProviders.getToken(
                      phone: widget.phone, code: controller.text);
                  if (!context.mounted) return;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const MainPage()),
                      (route) => false);
                }
              },
              text: "Готово"),
        ],
      ),
    )));
  }
}
