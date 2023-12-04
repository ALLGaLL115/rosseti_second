import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:rosseti_second/second_try/repo/auth_repo.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

// class AutheticationPage extends StatelessWidget {
//   const AutheticationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           AuthenticationBloc(authRepo: context.read<AuthRepo>()),
//       child: AutheticationView(),
//     );
//   }
// }

class AutheticationView extends StatelessWidget {
  final _formPhoneKey = GlobalKey<FormState>();
  final _formCodeKey = GlobalKey<FormState>();
  AutheticationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // lazy: false,
      create: (_) => AuthenticationBloc(
        authRepo: context.read<AuthRepo>(),
      ),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          final bloc = context.watch<AuthenticationBloc>();

          return Scaffold(
            body: WillPopScope(
              onWillPop: () {
                bloc.add(ResetEvent());

                return Future.value(false);
              },
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Builder(
                  builder: (_) {
                    switch (state.authenticationPage) {
                      case AuthenticationPage.inital:
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
                                Text(
                                  stringsUi['appName']!,
                                  // style: const TextStyle(
                                  //     color: mainColor,
                                  //     fontSize: 62,
                                  //     fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  stringsUi["innovator"]!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                // const Spacer(),
                                continueButton(
                                    onPressed: () {
                                      bloc.add(StartAuthenticationEvent());
                                    },
                                    text: stringsUi['registration']!)
                              ],
                            ));

                      case AuthenticationPage.phone:
                        return Form(
                          key: _formPhoneKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 150,
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  validator: (value) => state.phoneIsValid
                                      ? null
                                      : stringsUi["phoneValidation"],
                                  onChanged: (value) {
                                    context
                                        .read<AuthenticationBloc>()
                                        .add(PhoneChangedEvent(phone: value));
                                  },
                                  decoration: textFieldInputDecoration(
                                      hintText: stringsUi["phone"]),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Builder(builder: (_) {
                                  switch (bloc.state.codeStatus) {
                                    case GetCodeStatus.initial:
                                      return continueButton(
                                          onPressed: () {
                                            if (_formPhoneKey.currentState!
                                                .validate()) {
                                              bloc.add(GetCodeEvent());
                                            }
                                          },
                                          text: stringsUi["further"]!);
                                    case GetCodeStatus.loading:
                                      return const CircularProgressIndicator();
                                    case GetCodeStatus.success:
                                      return const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      );
                                    case GetCodeStatus.error:
                                      return Text(stringsUi["getCodeError"]!);
                                  }
                                })
                              ],
                            ),
                          ),
                        );
                      case AuthenticationPage.sms:
                        return Form(
                          key: _formCodeKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 150,
                                ),
                                TextFormField(
                                  onChanged: (value) => bloc.add(
                                      CodeForCheckChangedEvent(code: value)),
                                  validator: (value) => state.codeIsValid
                                      ? null
                                      : stringsUi["codeValidation"],
                                  decoration: textFieldInputDecoration(
                                      hintText: stringsUi["codeFromSms"]),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Builder(builder: (_) {
                                  switch (state.tokenStatus) {
                                    case GetTokenStatus.initial:
                                      return continueButton(
                                          onPressed: () {
                                            if (_formCodeKey.currentState!
                                                .validate()) {
                                              bloc.add(GetTokenEvent());
                                            }
                                          },
                                          text: stringsUi["done"]!);
                                    case GetTokenStatus.loading:
                                      return const CircularProgressIndicator();
                                    case GetTokenStatus.success:
                                      return const Icon(
                                        Icons.done,
                                        size: 20,
                                        color: Colors.green,
                                      );
                                    case GetTokenStatus.error:
                                      return Text(stringsUi["getCodeError"]!);
                                  }
                                })
                              ],
                            ),
                          ),
                        );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
