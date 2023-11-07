import 'package:flutter/material.dart';

import 'package:rosseti_second/strings.dart';
import 'package:rosseti_second/ui/widgets/widgets.dart';

class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({
    super.key,
  });

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("projects_string"),
        actions: getActions(context: context),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 123,
                width: double.infinity,
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    boxShadow: [
                      const BoxShadow(
                          spreadRadius: -6, blurRadius: 10, color: Colors.grey)
                    ]),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                "https://avatars.mds.yandex.net/i?id=3764ee6f3757f01ae5186486aa3f2bccd3c1d483-5220281-images-thumbs&n=13",
                              ))),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("title",
                              style: standart, overflow: TextOverflow.ellipsis),
                          Spacer(),
                          Text(
                            "author",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffA1A1A1)),
                          ),
                          Text('suggestion',
                              style: TextStyle(fontSize: 14, color: mainColor))
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
