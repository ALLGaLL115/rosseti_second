import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/constants/globals.dart';
import 'package:rosseti_second/models/models.dart';

class DataProviders {
  static Future getCode({required String phone}) async {
    final url =
        Uri.parse("https://phystechlab.ru/rosseti/public/api/auth/phone");
    final request = http.MultipartRequest("POST", url);
    request.fields.addAll({
      "phone": phone,
    });
    request.headers.addAll(
        {"Content-Type": "multipard/from-data", "Accept": "application/json"});

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode != 200) {
      throw "Error";
    }

    var body = jsonDecode(response.body) as Map;
    return body['code'];
  }

  static Future getToken({required String phone, required String code}) async {
    var url =
        Uri.parse("https://phystechlab.ru/rosseti/public/api/auth/verify-code");
    var request = http.MultipartRequest("POST", url);
    request.fields.addAll({
      "phone": phone,
      "code": code,
    });
    request.headers.addAll(
        {"Content-Type": "multipard/from-data", "Accept": "application/json"});

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode != 200) {
      throw "Error";
    }

    var body = jsonDecode(response.body) as Map;
    Globals.changeToken(body["token"]);
  }

  static Future getTopics({required String token}) async {
    var url = Uri.parse("https://phystechlab.ru/rosseti/public/api/topics");
    var response = await http.get(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });

    if (response.statusCode != 200) {
      throw "Error ${response.statusCode}";
    }

    var body = jsonDecode(response.body) as Map;
    var topics = body["topics"] as List;
    List<String> topicTitles = topics.map((e) => e["title"] as String).toList();

    Globals.addTopics(topicTitles);
  }

  static Future sendSuggestion() async {
    String token = Globals().token;

    final url =
        Uri.parse("http://phystechlab.ru/rosseti/public/api/suggestions/store");

    final request = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: SendSuggestion().toJson(),
    );
    if (request.statusCode != 200) print(request.body);
  }

  static sendSuggestionByMultipard() async {
    String token = Globals().token;

    var suggestion = SendSuggestion();
    final url =
        Uri.parse("http://phystechlab.ru/rosseti/public/api/suggestions/store");

    final request = http.MultipartRequest("POST", url);
    request.headers.addAll({
      "Accept": "application/json",
      "Authorization": "Bearer $token",
      "Content-Type": "multipard/from-data"
    });
    request.fields.addAll({
      "title": suggestion.title,
      "topicId": suggestion.topicId,
      "existingSolutionText!": suggestion.existingSolutionText!,
      "proposedSolutionText": suggestion.proposedSolutionText!,
      "positiveEffect": suggestion.positiveEffect!,
    });

    // MediaType(type, subtype);
    // var multipardFile = await http.MultipartFile.fromPath(
    //     'existing_solution_image', suggestion.existingSolutionImage);
    // request.files.add(multipardFile);

    request.files.add(http.MultipartFile.fromBytes("existing_solution_image",
        File(suggestion.existingSolutionImage!).readAsBytesSync(),
        filename: suggestion.existingSolutionImage!.split("/").last));
    request.files.add(await http.MultipartFile.fromPath(
        "existing_solution_image", suggestion.existingSolutionImage!));
    request.files.add(await http.MultipartFile.fromPath(
        "existing_solution_video", suggestion.existingSolutionVideo!));
    request.files.add(await http.MultipartFile.fromPath(
        "existing_solution_image", suggestion.proposedSolutionImage!));
    request.files.add(await http.MultipartFile.fromPath(
        "existing_solution_video", suggestion.proposedSolutionVideo!));

    http.Response response =
        await http.Response.fromStream(await request.send());
    if (response.statusCode != 200) throw "Error ${response.statusCode}";

    // if (response.statusCode != 200) throw "Error code ${response.statusCode}";
    // final body = jsonDecode(response);
    // StreamedResponse response = await request.send();
    // response.stream.transform(utf8.decoder).listen((value) {});
  }

  static Future getUser(String token) async {
    final url = Uri.parse("https://phystechlab.ru/rosseti/public/api/user");
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode != 200)
      throw "Error status code ${response.statusCode}";

    final body = jsonDecode(response.body);

    if (body == null) throw 'Error body is null';

    final author = Author.fromJson(body);
    Globals.addUser(author);
  }

  static Future getSuggestions() async {
    String token = Globals().token;
    final url = Uri.parse(
        "https://phystechlab.ru/rosseti/public/api/suggestions/index");
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode != 200) throw "Error code ${response.statusCode}";
    final body = jsonDecode(response.body);
    final suggestionsJson = body["suggestions"] as List;
    List<Suggestion> suggestions = suggestionsJson
        .map(
          (e) => Suggestion.fromJson(e),
        )
        .toList();

    Globals.addSuggestions(suggestions);
  }
}
