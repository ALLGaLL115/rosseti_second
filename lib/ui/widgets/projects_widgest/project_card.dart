import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

projectCard(
    {required String author,
    required String projectName,
    required String projectTopic,
    required String projectImageUrl,
    required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 123,
        width: double.infinity,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(spreadRadius: -6, blurRadius: 10, color: Colors.grey)
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
                        projectImageUrl,
                      ))),
            ),
            const Spacer(),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(projectName,
                      style: standart, overflow: TextOverflow.ellipsis),
                  const Spacer(),
                  Text(
                    author,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xffA1A1A1)),
                  ),
                  Text(projectTopic,
                      style: const TextStyle(fontSize: 14, color: mainColor))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
