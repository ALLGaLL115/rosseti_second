import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/constants.dart';
import '../../constants/widgets.dart';
import '../../data_providers.dart';
import 'pages.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PhoneView();
  }
}

class PhoneView extends StatefulWidget {
  const PhoneView({
    super.key,
  });

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  TextEditingController controller = TextEditingController();

  PhoneCountryData? _initialCountryData;
  @override
  void initState() {
    // TODO: implement initState
    PhoneInputFormatter.replacePhoneMask(
        countryCode: "RU", newMask: "+0 (000) 000 00 00");

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
                Container(
                  width: double.infinity,
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: mainColor, width: 2),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0.1,
                            color: Colors.grey,
                            blurRadius: 1,
                            offset: Offset(0, 1))
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  clipBehavior: Clip.hardEdge,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Телефон",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
                      errorStyle: TextStyle(
                        color: Colors.red,
                      ),
                      counterText: "",
                    ),
                    maxLength: 18,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      PhoneInputFormatter(
                          allowEndlessPhone: false,
                          defaultCountryCode: _initialCountryData?.countryCode)
                    ],
                    onEditingComplete: () async {
                      if (controller.text.length > 17) {
                        final code =
                            await DataProviders.getCode(phone: controller.text);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SmsPage(
                            phone: controller.text,
                            code: code,
                          ),
                        ));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContinueButton(
                    onPressed: () async {
                      if (controller.text.length > 17) {
                        final code =
                            await DataProviders.getCode(phone: controller.text);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SmsPage(
                            phone: controller.text,
                            code: code,
                          ),
                        ));
                      }
                    },
                    text: "Далее")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
