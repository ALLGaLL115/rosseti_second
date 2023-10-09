import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'ui/pages/pages.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Globals.takeSize(MediaQuery.of(context).size);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(),
          actionIconTheme: ActionIconThemeData(
            backButtonIconBuilder: (context) =>
                const Icon(Icons.arrow_back_ios),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: mainColor,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          fontFamily: 'ABeeZee',
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(),
            titleTextStyle: appbarTextStyle,
            centerTitle: true,
            foregroundColor: mainColor,
            backgroundColor: Colors.transparent,
            toolbarHeight: 100,
          ),
        ),
        home: const StartPage());
  }
}
