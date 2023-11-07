import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/blocs/sing_in_bloc/sing_in_bloc.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class StartPage extends StatefulWidget {
  const StartPage({
    super.key,
  });

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late Box<String> tokenBox;
  @override
  void initState() {
    // TODO: implement initState
    tokenBox = Boxes.getTokenBox();

    super.initState();
  }

  @override
  Widget build(BuildContext ccontext) {
    final singInBloc = BlocProvider.of<SingInBloc>(context);

    return BlocBuilder<SingInBloc, SingInState>(
      builder: (context, state) {
        if (state is SingInLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SingInInitial) {
          if (tokenBox.isNotEmpty) {
            return MainPage();
          } else {
            return const StartSingInPage();
          }
        } else if (state is SinInSecondPage) {
          return const PhoneView();
        } else if (state is SingInCodeTaked) {
          return const SmsPage();
        } else if (state is SingInDone) {
          return MainPage();
        }
        return Container();

        // throw "AuthenticationError";
        // return Container();
      },
    );
  }
}

class StartSingInPage extends StatelessWidget {
  const StartSingInPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const StartSingInView();
  }
}

class StartSingInView extends StatelessWidget {
  const StartSingInView({
    super.key,
  });

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
              const Spacer(),
              continueButton(
                  onPressed: () {
                    BlocProvider.of<SingInBloc>(context).add(OpenSecondEvent());
                  },
                  text: "next")
            ],
          ),
        ));
  }
}

// StartRegistration
// FetchCode
// GetToken

class PhoneView extends StatefulWidget {
  const PhoneView({
    super.key,
  });

  static Route route() => MaterialPageRoute(
        builder: (_) => const PhoneView(),
      );

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  TextEditingController controller = TextEditingController();

  PhoneCountryData? _initialCountryData;
  @override
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
                      hintText: "phone_string",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
                      errorStyle: const TextStyle(
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
                      BlocProvider.of<SingInBloc>(context)
                          .add(FetchCodeEvent(phone: controller.text));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<SingInBloc>(context)
                          .add(FetchCodeEvent(phone: controller.text));
                    },
                    child: const Text("next"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SmsPage extends StatefulWidget {
  const SmsPage({
    super.key,
  });

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
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
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "code_from_SMS",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.grey),
                  border: InputBorder.none,
                ),
              )),
          const SizedBox(height: 20),
          BlocBuilder<SingInBloc, SingInState>(
            builder: (context, state) {
              return continueButton(
                  onPressed: () async {
                    if (state is SingInCodeTaked) {
                      if (controller.text == state.code) {
                        BlocProvider.of<SingInBloc>(context).add(
                            FetchTokenEvent(
                                phone: state.phone, code: state.code));
                      }
                    }
                  },
                  text: "done");
            },
          ),
        ],
      ),
    )));
  }
}
