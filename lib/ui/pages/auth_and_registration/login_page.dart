import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/pages/auth_and_registration/phone_number_page.dart';

import '../../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: const EdgeInsets.only(
                top: 151, bottom: 122, left: 24, right: 24),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/image 1.png",
                  height: 141,
                  width: 141,
                ),
                const Text(
                  "name",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 62,
                      fontWeight: FontWeight.w400),
                ),
                const Text(
                  "innovator",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                // const Spacer(),
                continueButton(onPressed: () {}, text: "next")
              ],
            )));
  }
}
