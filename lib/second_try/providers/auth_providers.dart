import 'dart:convert';

import 'package:http/http.dart' as http;

class AutheticatoinProviders {
  getCode(String phone) async {
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
    if (body.isEmpty) throw "Body empty error";

    return body['code'];
  }

  Future getToken({required String phone, required String code}) async {
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

    if (response.statusCode != 200) throw "Errorerer ${response.statusCode}";
    var body = jsonDecode(response.body) as Map;
    if (body.isEmpty) throw "Body empty error";
    return body["token"];
  }
}
