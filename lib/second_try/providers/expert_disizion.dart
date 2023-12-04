import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/boxes.dart';

class ExpertDesizionProviders {
  final _token = Boxes.getTokenBox().values.single;

  Future<Either<String, bool>> addExpertEvaliation({
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
        body: jsonEncode({
          "suggestion_id": suggestionId,
          "accepted": accepted,
          "expert_id": expertId
        }));
    try {
      var json = await jsonDecode(request.body);
      return right(json['success']);
    } catch (e) {
      return left(e.toString());
    }
  }
}
