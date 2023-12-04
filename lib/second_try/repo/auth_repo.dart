import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/providers/auth_providers.dart';

interface class AuthRepo {
  final AutheticatoinProviders _autheticatoinProviders =
      AutheticatoinProviders();

  getCode({required String phone}) async {
    try {
      return await _autheticatoinProviders.getCode(phone);
    } catch (e) {
      rethrow;
    }
  }

  getToken({
    required String phone,
    required String code,
  }) async {
    try {
      return await _autheticatoinProviders.getToken(phone: phone, code: code);
    } catch (e) {
      rethrow;
    }
  }

  saveToken({required String token}) {
    final box = Boxes.getTokenBox();
    box.clear();
    box.add("Bearer $token");
  }

  getTopics({required String token}) async {
    try {
      final topics = await _autheticatoinProviders.getTopics(token: token);
      final box = Boxes.getTopicsBox();
      box.clear();
      box.addAll(topics);
    } catch (e) {
      rethrow;
    }
  }
}
