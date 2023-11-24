import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/suggestion_model.dart';

class SuggestionProviders {
  final _token = Boxes.getTokenBox().values.single;

  Future<bool> addExpertEvaliation({
    // required String token,
    required int suggestionId,
    required int accepted,
    required int expertId,
  }) async {
    // final token = Boxes.getTokenBox().values.single;

    const String url =
        "https://phystechlab.ru/rosseti/public/api/suggestions/expert-judgment";

    var request = await http.post(
        Uri.parse(
          url,
        ),
        headers: {
          "Accept": "application/json",
          "Authorization": _token,
          "Content-Type": "multipart/form-data"
        },
        body: {
          "suggestion_id": suggestionId,
          "accepted": accepted,
          "expert_id": expertId
        });
    try {
      var json = await jsonDecode(request.body);
      return json['succes'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Either<String, bool>> addRating(
      {required int suggestionId, required int value}) async {
    var url =
        "https://phystechlab.ru/rosseti/public/api/suggestions/rating/store";

    var request = await http.post(
        Uri.parse(
          url,
        ),
        headers: {
          "Accept": "application/json",
          "Authorization": _token,
          "Content-Type": "multipart/form-data"
        },
        body: {
          "suggestion_id": suggestionId,
          "value": value
        });

    try {
      if (request.statusCode != 200)
        throw "StatusCode Error ${request.statusCode}";

      var json = await jsonDecode(request.body);
      var result = json['succes'];
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> addComment(
      {required String text, required int suggestionId}) async {
    var url =
        "https://phystechlab.ru/rosseti/public/api/suggestions/rating/store";

    var request = await http.post(
        Uri.parse(
          url,
        ),
        headers: {
          "Accept": "application/json",
          "Authorization": _token,
          "Content-Type": "multipart/form-data"
        },
        body: {
          "suggestion_id": suggestionId,
          "text": text
        });

    try {
      if (request.statusCode != 200) {
        throw "StatusCode Error ${request.statusCode}";
      }
      var jsonBody = jsonDecode(request.body);
      return right(jsonBody["succes"]);
    } catch (e) {
      return left(e.toString());
    }
  }
}
