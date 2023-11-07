import 'package:rosseti_second/second_try/boxes.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/models/send_suggestion.dart';

class SendSuggestionProvider {
  Future sendSuggestion(
      {required CreateSuggestionModel suggestionModel}) async {
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
    request.files.add(await http.MultipartFile.fromPath(
        "existing_solution_video", suggestionModel.existingSolutionVideo!));
    request.files.add(await http.MultipartFile.fromPath(
        "proposed_solution_image", suggestionModel.proposedSolutionImage!));
    request.files.add(await http.MultipartFile.fromPath(
        "proposed_solution_video", suggestionModel.proposedSolutionVideo!));

    try {
      final response = await request.send();
      if (response != 200) return false;
      return true;
    } catch (e) {}
  }
}
