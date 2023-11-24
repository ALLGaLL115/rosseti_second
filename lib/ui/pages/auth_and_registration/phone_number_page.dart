import 'package:flutter/material.dart';
import 'package:rosseti_second/ui/pages/auth_and_registration/sms_code_page.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({
    super.key,
  });

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  InputField(onChange: (value) {}),
                  const SizedBox(
                    height: 20,
                  ),
                  continueButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SmsPage(),
                        ));
                      },
                      text: "next")
                ],
              ),
            )),
      ),
    );
  }
}
