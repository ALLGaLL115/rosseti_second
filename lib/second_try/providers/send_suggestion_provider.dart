import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:rosseti_second/second_try/boxes.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/models/send_suggestion.dart';

class SendSuggestionProvider {
  //Тут проблема в том что мультипард не отправляет int в итоге 500 ошибка
  Future<Either<String, bool>> sendSuggestion(
      {required SuggestionSendModel suggestionModel}) async {
    final token = Boxes.getTokenBox().values.single;
    final url = Uri.parse(
        "https://phystechlab.ru/rosseti/public/api/suggestions/store");
    final request = http.MultipartRequest("POST", url);
    request.headers
        .addAll({"Accept": "application/json", "Authorization": token});
    request.fields.addAll({
      "title": suggestionModel.title!,
      "topicId": suggestionModel.topicId.toString(),
      "positiveEffect": suggestionModel.positiveEffect!,
    });
    request.files.add(await http.MultipartFile.fromPath(
        "existing_solution_image", suggestionModel.existingSolutionImage!));
    // request.files.add(await http.MultipartFile.fromPath(
    //     "existing_solution_video", suggestionModel.existingSolutionVideo!));
    request.files.add(await http.MultipartFile.fromPath(
        "proposed_solution_image", suggestionModel.proposedSolutionImage!));
    // request.files.add(await http.MultipartFile.fromPath(
    //     "proposed_solution_video", suggestionModel.proposedSolutionVideo!));

    final response = await http.Response.fromStream(await request.send());
    final json = jsonDecode(response.body);
    if (response.statusCode != 200) {
      return left(json["message"]);
    }
    return right(json["success"]);
  }

// тоже не работает
  Future<Either<String, String>> sendSug(
      {required String token,
      required SuggestionSendModel suggestionModel}) async {
    final url = Uri.parse(
        "https://phystechlab.ru/rosseti/public/api/suggestions/store");

    final request = await http.post(url,
        headers: {"Accept": "application/json", "Authorization": token},
        body: jsonEncode(suggestionModel.toJson()));

    final json = await jsonDecode(request.body);
    if (request.statusCode != 200) {
      print("EErorr ${json["message"]}");
      return left("Fail error ${request.statusCode} ");
    } else {
      return right("success");
    }
  }
}
