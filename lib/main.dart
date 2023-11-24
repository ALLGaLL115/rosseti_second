import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/done/create_project_bloc/create_project_bloc.dart';
import 'package:rosseti_second/second_try/blocs/done/sing_in_bloc/sing_in_bloc.dart';
import 'package:rosseti_second/second_try/blocs/suggestion_ckeck_bloc/suggestion_check_bloc.dart';
import 'package:rosseti_second/second_try/blocs/suggestions_bloc/suggestion_bloc.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/comment_model.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
import 'package:rosseti_second/second_try/providers/auth_providers.dart';
import 'package:rosseti_second/second_try/providers/projects_provider.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/pages/auth_and_registration/authetication.dart';
// lib\ui\pages\auth_and_registration\
// import 'package:rosseti_second/data/repositories/repository.dart';
import 'ui/pages/pages.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  // final appDocDir = await getApplicationDocumentsDirectory();

  await Hive.initFlutter();
  Hive.registerAdapter(CommentAdapter());
  Hive.registerAdapter(UserAdapter());
  // Hive.registerAdapter(SuggestionAdapter());
  Hive.registerAdapter(TopicAdapter());

  // await Hive.openBox("tokenBox");
  await Hive.openBox<User>("userBox");
  await Hive.openBox<Topic>("topics");
  await Hive.openBox<String>("tokenBox");
  // await Hive.openBox<Comment>("commentsBox");
  // await Hive.openBox<Suggestion>("suggestionBox");

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              SingInBloc(autheticatoinProviders: AutheticatoinProviders()),
        ),
        BlocProvider(
          create: (_) => CreateProjectBloc(),
        ),
        BlocProvider(
            create: (_) =>
                SuggestionBloc(projectsProvider: ProjectsProvider())),
        BlocProvider(create: (_) => SuggestionCheckBloc()),
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
          home: ValueListenableBuilder(
            valueListenable: Boxes.getTokenBox().listenable(),
            builder: (context, box, __) {
              if (box.isEmpty) {
                return const AutheticationPage();
              } else {
                // box.clear();
                return MainView();
              }
            },
          )

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
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
