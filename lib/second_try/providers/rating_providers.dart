import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/boxes.dart';

class RatingProvider {
  Future<Either<String, bool>> addRating(
      {required int suggestionId, required int value}) async {
    final _token = Boxes.getTokenBox().values.first;
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
        body: jsonEncode({"suggestion_id": suggestionId, "value": value}));

    try {
      if (request.statusCode != 200)
        throw "StatusCode Error ${request.statusCode}";

      var json = await jsonDecode(request.body);
      var result = json['success'];
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }
}
