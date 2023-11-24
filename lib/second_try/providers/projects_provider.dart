import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/models/suggestion_model.dart';

class ProjectsProvider {
  final _token = Boxes.getTokenBox().values.single;

  Future<Either<String, List<Suggestion>>> getProjects() async {
    final url = "https://phystechlab.ru/rosseti/public/api/suggestions/index";

    var respone = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": _token,
    });

    try {
      if (respone.statusCode != 200) {
        throw "Suggestions status code error ${respone.statusCode}";
      }
      var jsonBody = await jsonDecode(respone.body);
      final suggestions = jsonBody['suggestions'];
      return right(suggestions);
    } catch (e) {
      return left(e.toString());
    }
  }
}
