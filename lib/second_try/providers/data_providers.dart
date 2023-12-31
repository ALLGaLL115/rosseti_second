import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rosseti_second/second_try/models/user_model.dart';

class DataProviders {
  Future<User> getUser({required String token}) async {
    final url = Uri.parse("https://phystechlab.ru/rosseti/public/api/user");
    final response = await http.get(url,
        headers: {'Accept': 'application/json', 'Authorization': token});

    try {
      if (response.statusCode != 200) {
        throw "Error status code ${response.statusCode}";
      }

      final body = jsonDecode(response.body);
      final user = User.fromJson(body);

      if (body == null) throw 'Error body is null';
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
