import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/models/topic_model.dart';

class AutheticatoinProviders {
  Future<String> getCode(String phone) async {
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
    if (response.statusCode != 200) throw "Errorerer ${response.statusCode}";

    var body = jsonDecode(response.body) as Map;

    return body["code"];
  }

  Future<String> getToken({required String phone, required String code}) async {
    var url =
        Uri.parse("https://phystechlab.ru/rosseti/public/api/auth/verify-code");
    var request = http.MultipartRequest("POST", url);
    request.fields.addAll({
      "phone": phone,
      "code": code,
    });
    request.headers.addAll(
        {"Content-Type": "multipard/from-data", "Accept": "application/json"});

    try {
      http.Response response =
          await http.Response.fromStream(await request.send());

      if (response.statusCode != 200) throw "Errorerer ${response.statusCode}";
      var body = jsonDecode(response.body) as Map;
      if (body["success"] != true) throw "Body empty error";
      return "Bearer ${body['token']}";
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Topic>> getTopics({required String token}) async {
    var url = Uri.parse("https://phystechlab.ru/rosseti/public/api/topics");
    var response = await http.get(url,
        headers: {"Accept": "application/json", "Authorization": token});
    try {
      if (response.statusCode != 200) {
        throw "Error ${response.statusCode}";
      }

      var body = jsonDecode(response.body) as Map;
      var topicsJson = body["topics"] as List;
      var topics = topicsJson.map((json) => Topic.fromJson(json)).toList();
      return topics;
    } catch (e) {
      rethrow;
    }
  }
}
