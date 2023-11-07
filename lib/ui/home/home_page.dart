import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/main_bloc/main_bloc.dart';
import 'package:rosseti_second/second_try/repo/main_repo.dart';
import 'package:rosseti_second/second_try/repo/topics_repo.dart';
import 'package:rosseti_second/second_try/repo/user_repo.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/create_project/create_page1.dart';
import 'package:rosseti_second/ui/home/status_page.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final HomeRepository _homeRepo = HomeRepository();
  final UserRepository _userRepository = UserRepository();
  final TopicsRepository _topicsRepository = TopicsRepository();
  final MainRepository _mainRepository = MainRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _mainRepository,
      child: BlocProvider(
        create: (context) => MainBloc(
            mainRepository: _mainRepository,
            userRepository: _userRepository,
            topicsRepository: _topicsRepository),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            switch (state.status) {
              case MainStatus.initialPage:
                return MainView(
                  bloc: context.watch<MainBloc>(),
                );
              case MainStatus.userPage:
                return const StatusPage();
              case MainStatus.creatingPage:
                return const CreatePage1();
              case MainStatus.projectsPage:
                return const ProjectsPage();
              case MainStatus.suggestionPage:
                return const SuggestionsPage();
              // case ErrorState():
              //   return ErrorWidget(state.error);
            }

            // MainLoading
            // MainInitial
            // UserStatus
            // CreateProjectState
            // ProjectsState
            // SuggestionsState
            // ErrorState
          },
        ),
      ),
    );
  }
}

class MainView extends StatelessWidget {
  final MainBloc bloc;

  MainView({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<MainBloc>(oldContext);
    final repo = RepositoryProvider.of<MainRepository>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "name",
            style: standart,
          ),
          actions: getActions(context: context),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            mainPageWidget(
                text: "create_an_offer",
                assetImagePath: "assets/images/create 1.png",
                onPressed: () {
                  bloc.add(MainStatusChanged(status: MainStatus.creatingPage));
                }),
            mainPageWidget(
                text: "applications",
                assetImagePath: "assets/images/idea 1.png",
                onPressed: () {
                  repo.openProjectsPage();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const SuggestionPage(),
                  // ));
                }),
            mainPageWidget(
                text: "expertise",
                assetImagePath: "assets/images/skills 1.png",
                onPressed: () {
                  repo.openSuggestionPage();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const ProjectsForCheckPage(),
                  // ));
                }),
          ],
        ),
      ),
    );
  }
}
