import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rosseti_second/ui/pages/pages.dart';

import '../../constants/constants.dart';

class StartPage extends StatefulWidget {
  const StartPage({
    super.key,
  });

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    // TODO: implement initState

    Permission.camera.request();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding:
              const EdgeInsets.only(top: 151, bottom: 122, left: 24, right: 24),
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
                "seti.inno",
                style: TextStyle(
                    color: mainColor,
                    fontSize: 62,
                    fontWeight: FontWeight.w400),
              ),
              const Text(
                "Рационализатор",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              continueButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PhonePage(),
                    ));
                  },
                  text: "Регистрация"),
            ],
          ),
        ));
  }
}
