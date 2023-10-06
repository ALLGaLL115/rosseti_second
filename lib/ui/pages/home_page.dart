import 'package:flutter/material.dart';
import 'package:rosseti_second/constants/constants.dart';
import 'package:rosseti_second/data_providers.dart';
import 'package:rosseti_second/main.dart';
import 'package:rosseti_second/models/models.dart';
import 'package:rosseti_second/ui/pages/pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    var token = Globals().token;

    DataProviders.getTopics(token: token);
    DataProviders.getUser(token);

    List<Suggestion> suggestions = Globals().suggesitons;
    if (suggestions.isEmpty) {
      DataProviders.getSuggestions();
    }

    super.initState();
  }

  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   var token = Globals().getToken;

  //   DataProviders.getUser(token);
  //   DataProviders.getTopics(token: token);
  //   super.setState(fn);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'seti.inno',
            style: appbarTextStyle,
          ),
          actions: getActions(context: context),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainPageWidget(
                text: "Создать\nпредложение",
                assetImagePath: "assets/images/create 1.png",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreatePage1(),
                  ));
                }),
            MainPageWidget(
                text: "Заявки",
                assetImagePath: "assets/images/idea 1.png",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SuggestionPage(),
                  ));
                }),
            MainPageWidget(
                text: "Экспертизы",
                assetImagePath: "assets/images/skills 1.png",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProjectsForCheckPage(),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
