import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/colors.dart';
import 'package:rosseti_second/second_try/blocs/cubits/desizion_cubit/desizion_cubit.dart';
import 'package:rosseti_second/second_try/blocs/cubits/expertize_cubit/expertise_cubit.dart';
import 'package:rosseti_second/second_try/blocs/cubits/rating_cubit/rating_cubit.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/comment_model.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
import 'package:rosseti_second/second_try/providers/expert_disizion.dart';
import 'package:rosseti_second/second_try/providers/projects_provider.dart';
import 'package:rosseti_second/second_try/providers/rating_providers.dart';
import 'package:rosseti_second/second_try/providers/send_suggestion_provider.dart';
import 'package:rosseti_second/second_try/repo/auth_repo.dart';

import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/text_styles.dart';
import 'package:rosseti_second/ui/pages/authetication.dart';
// lib\ui\pages\auth_and_registration\
// import 'package:rosseti_second/data/repositories/repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rosseti_second/ui/pages/home_page.dart';

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
  await Hive.openBox<Topic>("topics");
  await Hive.openBox<String>("tokenBox");
  // await Hive.openBox<Comment>("commentsBox");
  await Hive.openBox<Suggestion>("suggestionBox");
  // Boxes.getTokenBox().clear();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepo(),
        ),
        RepositoryProvider(
          create: (context) => SendSuggestionProvider(),
        ),
        RepositoryProvider(
          create: (context) => ProjectsProvider(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RatingCubit(ratingProvider: RatingProvider()),
          ),
          BlocProvider(
            create: (context) => ExpertiseCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  DesizionCubit(desizionProviders: ExpertDesizionProviders()))
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
                centerTitle: true,
                titleTextStyle: titleTextStyle,
                foregroundColor: mainColor,
                backgroundColor: Colors.transparent,
                toolbarHeight: 100,
              ),
            ),
            home: ValueListenableBuilder(
              valueListenable: Boxes.getTokenBox().listenable(),
              builder: (context, box, __) {
                if (box.isEmpty) {
                  return AutheticationView();
                } else {
                  // box.clear();
                  return const MainView();
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
