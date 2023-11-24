import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/done/sing_in_bloc/sing_in_bloc.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class AutheticationPage extends StatelessWidget {
  const AutheticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutheticationView();
  }
}

class AutheticationView extends StatefulWidget {
  const AutheticationView({
    super.key,
  });

  @override
  State<AutheticationView> createState() => _AutheticationViewState();
}

class _AutheticationViewState extends State<AutheticationView> {
  final phoneController = TextEditingController();
  final smsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SingInBloc>();
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocBuilder<SingInBloc, SingInState>(
          builder: (context, state) {
            switch (state.page) {
              case SingInPage.first:
                return Container(
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
                        continueButton(
                            onPressed: () {
                              bloc.add(ChangePage(page: SingInPage.second));
                            },
                            text: "next")
                      ],
                    ));

              case SingInPage.second:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      TextFormField(
                        onChanged: (value) =>
                            bloc.add(PhoneChanged(phone: value)),
                        initialValue: state.phone,
                        decoration: textFieldInputDecoration(hintText: phone),
                      ),
                      // InputField(
                      //     controller: phoneController,
                      //     hintText: phone,
                      //     initialText: state.phone,
                      //     onChange: (value) {}),
                      const SizedBox(
                        height: 20,
                      ),
                      continueButton(
                          onPressed: () {
                            bloc.add(IdentificatePhone());
                          },
                          text: "next22")
                    ],
                  ),
                );
              case SingInPage.third:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      TextFormField(),
                      TextFormField(
                        onChanged: (value) =>
                            bloc.add(InputCodeChanged(newCode: value)),
                        initialValue: state.phone,
                        decoration: textFieldInputDecoration(hintText: phone),
                      ),
                      // InputField(
                      //     hintText: codeFromSms,
                      //     initialText: state.inputCode,
                      //     onChange: (value) {
                      //       // bloc.add();
                      //     }),
                      const SizedBox(
                        height: 20,
                      ),
                      continueButton(
                          onPressed: () {
                            bloc.add(
                                Authentication(inputCode: state.inputCode));
                          },
                          text: "next")
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
