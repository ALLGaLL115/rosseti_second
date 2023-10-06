import 'package:flutter/material.dart';
import 'package:rosseti_second/constants/globals.dart';
import 'package:rosseti_second/constants/text_style.dart';
import 'package:rosseti_second/constants/widgets.dart';
import 'package:rosseti_second/models/models.dart';

import '../../main.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  List<Suggestion> suggestions = Globals().suggesitons;

  @override
  Widget build(BuildContext context) {
    if (Globals().suggesitons.isEmpty) {
      Future.delayed(const Duration(seconds: 2), () => setState(() {}));
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: const Text("Проекты"),
                actions: getActions(context: context),
              ),
              body: Center(child: const CircularProgressIndicator())));
    } else {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Проекты"),
          actions: getActions(context: context),
        ),
        body: ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => DoExpertDissizionPage(
                        suggestion: suggestions[index]))));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 123,
                  width: double.infinity,
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                            spreadRadius: -6,
                            blurRadius: 10,
                            color: Colors.grey)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  suggestions[index].existingSolutionImage ??
                                      "https://avatars.mds.yandex.net/i?id=3764ee6f3757f01ae5186486aa3f2bccd3c1d483-5220281-images-thumbs&n=13",
                                ))),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(suggestions[index].title ?? "title",
                                style: standart,
                                overflow: TextOverflow.ellipsis),
                            const Spacer(),
                            Text(
                              suggestions[index].author!.fullName ?? "author",
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xffA1A1A1)),
                            ),
                            Text(suggestions[index].topicId.toString(),
                                style: const TextStyle(
                                    fontSize: 14, color: mainColor))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ));
    }
  }
}
