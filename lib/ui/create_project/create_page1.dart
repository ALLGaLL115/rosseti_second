import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rosseti_second/second_try/blocs/create_project_bloc/create_project_bloc.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/repo/send_suggestion_repo.dart';
import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/create_project/create_page2.dart';
import '../widgets/widgets.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});
  final CreateSuggestionRepo _createSuggestionRepo = CreateSuggestionRepo();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _createSuggestionRepo,
      child: BlocProvider(
        create: (context) =>
            CreateProjectBloc(createSuggestionRepo: _createSuggestionRepo),
        child: BlocBuilder<CreateProjectBloc, CreateProjectState>(
          builder: (context, state) {
            switch (state.status) {
              case CreateSuggestionStatus.start:
                return CreatePage1();
              case CreateSuggestionStatus.exesting:
                return CreatePage2();
              case CreateSuggestionStatus.proposed:
                return Container(
                  child: Text("3"),
                );
              case CreateSuggestionStatus.positive:
                return Container(
                  child: Text("4"),
                );
            }
          },
        ),
      ),
    );
  }
}

class CreatePage1 extends StatefulWidget {
  const CreatePage1({
    super.key,
  });

  @override
  State<CreatePage1> createState() => _CreatePage1State();
}

class _CreatePage1State extends State<CreatePage1> {
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("create"),
          actions: getActions(context: context),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "tell_us_about_the_offer",
                  style: standart,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  "choose_a_theme_and_title",
                  style: standart,
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ValueListenableBuilder(
                            valueListenable: Boxes.getTopicsBox().listenable(),
                            builder: (context, box, _) {
                              if (box.isEmpty) {
                                return const Text("data");
                              }

                              return topicsListView(box.values.single);
                            },
                          );
                        });
                  },
                  child: Container(
                      // height: 58,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: mainColor)),
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 9,
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText: "value",
                                      border: InputBorder.none),
                                ),
                              )),
                          Flexible(
                              flex: 1,
                              child: Image.asset(
                                  "assets/images/video-player 1.png")),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 35,
                ),
                inputField(
                  hintText: "naming",
                  onChange: (value) {},
                ),
                const SizedBox(
                  height: 188,
                ),
                continueButton(
                    onPressed: () {
                      //   Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => const CreatePage2()));
                    },
                    text: "next"),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

topicsListView(List<Topic> topics) {
  return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];
        return GestureDetector(
          onTap: () {
            //selsect topic
            Navigator.of(context).pop();
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: mainColor, width: 1),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 5)
                ]),
            child: Text(
              topic.title!,
              style: const TextStyle(color: mainColor, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        );
      });
}
