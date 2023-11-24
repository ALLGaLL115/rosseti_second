import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti_second/second_try/blocs/suggestion_ckeck_bloc/suggestion_check_bloc.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/pages/create_project/create_page1.dart';
import 'package:rosseti_second/ui/pages/pages.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

// class MainPage extends StatefulWidget {
//   MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   // final HomeRepository _homeRepo = HomeRepository();
//   final UserRepository _userRepository = UserRepository();
//   final TopicsRepository _topicsRepository = TopicsRepository();
//   final MainRepository _mainRepository = MainRepository();

//   @override
//   Widget build(BuildContext context) {
//     return

//           // MainLoading
//           // MainInitial
//           // UserStatus
//           // CreateProjectState
//           // ProjectsState
//           // SuggestionsState
//           // ErrorState

//   }
// }

class MainView extends StatelessWidget {
  MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreatingPage()));
                }),
            mainPageWidget(
                text: "applications",
                assetImagePath: "assets/images/idea 1.png",
                onPressed: () {
                  BlocProvider.of<SuggestionCheckBloc>(context).add(
                      const ChoseInspectorEvent(
                          inspector: SuggestionCheckInspector.usual));

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProjectsPage(),
                  ));
                }),
            mainPageWidget(
                text: "expertise",
                assetImagePath: "assets/images/skills 1.png",
                onPressed: () {
                  BlocProvider.of<SuggestionCheckBloc>(context).add(
                      const ChoseInspectorEvent(
                          inspector: SuggestionCheckInspector.expert));
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProjectsPage(),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
