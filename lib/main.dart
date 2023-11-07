import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/sing_in_bloc/sing_in_bloc.dart';
import 'package:rosseti_second/second_try/models/comment_model.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
import 'package:rosseti_second/second_try/repo/sing_in_repo.dart';
import 'package:rosseti_second/strings.dart';
// import 'package:rosseti_second/data/repositories/repository.dart';
import 'ui/pages/pages.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  // final appDocDir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter();
  Hive.registerAdapter(CommentAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(SuggestionAdapter());
  Hive.registerAdapter(TopicAdapter());

  // await Hive.openBox("tokenBox");
  await Hive.openBox<User>("userBox");
  await Hive.openBox<List<Topic>>("topics");
  await Hive.openBox<String>("tokenBox");
  // await Hive.openBox<Comment>("commentsBox");
  // await Hive.openBox<Suggestion>("suggestionBox");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MyAppView();
  }
}

class MyAppView extends StatelessWidget {
  MyAppView({
    super.key,
  });

  final SingInRepo _singInRepo = SingInRepo();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SingInRepo>.value(value: _singInRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SingInBloc(
                    singInRepo: _singInRepo,
                  ))
        ],
        child: MaterialApp(
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
              // titleTextStyle: appbarTextStyle,
              centerTitle: true,
              foregroundColor: mainColor,
              backgroundColor: Colors.transparent,
              toolbarHeight: 100,
            ),
          ),

          home: const StartPage(),

          // switch (state) {
          //   case :
          //     return StartPage(

          //     );
          //   // Navigator.of(context).pushAndRemoveUntil(
          //   //     MaterialPageRoute(builder: (context) => StartPage()),
          //   //     (route) => false);
          //   case AuthenticatedState:
          //     return const MainPage();
          //   // Navigator.of(context).pushAndRemoveUntil(
          //   //     MaterialPageRoute(
          //   //       builder: (context) => MainPage(),
          //   //     ),
          //   //     (route) => false);

          //   case AuthenticationStatus.unknown:
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          // }
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
