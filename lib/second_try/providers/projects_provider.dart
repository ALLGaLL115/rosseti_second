import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/models/suggestion_model.dart';

class ProjectsProvider {
  Future<Either<String, List<Suggestion>>> getProjects(
      final String token) async {
    const url = "https://phystechlab.ru/rosseti/public/api/suggestions/index";

    var respone = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": token,
    });

    try {
      if (respone.statusCode != 200) {
        throw "Suggestions status code error ${respone.statusCode}";
      }
      var json = await jsonDecode(respone.body);
      final jsonSuggestions = json['suggestions'] as List;
      final suggestions = jsonSuggestions
          .map(
            (e) => Suggestion.fromJson(e),
          )
          .toList();

      return right(suggestions);
    } catch (e) {
      return left(e.toString());
    }
  }
}
