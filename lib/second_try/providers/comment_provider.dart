import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/comment_model.dart';

class CommentProvider {
  Future<Either<String, List<Comment>>> addComment(
      {required String text, required int suggestionId}) async {
    final _token = Boxes.getTokenBox().values.first;
    var url =
        "https://phystechlab.ru/rosseti/public/api/suggestions/comment/store";

    final request = http.MultipartRequest(
      "POST",
      Uri.parse(
        url,
      ),
    );

    request.headers.addAll(
      {
        "Accept": "application/json",
        "Authorization": _token,
        "Content-Type": "multipart/form-data"
      },
    );
    request.fields
        .addAll({"suggestion_id": suggestionId.toString(), "text": text});

    final response = await http.Response.fromStream(await request.send());

    try {
      if (response.statusCode != 200) {
        throw "StatusCode Error ${response.statusCode}";
      }
      var jsonBody = jsonDecode(response.body);
      final commentsJson = jsonBody['comments'] as List;
      final comments = commentsJson.map((e) => Comment.fromJson(e)).toList();

      return right(comments);
    } catch (e) {
      return left(e.toString());
    }
  }
}
