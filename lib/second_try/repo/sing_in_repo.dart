import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/providers/auth_providers.dart';

class SingInRepo {
  final AutheticatoinProviders _authenticationProviders =
      AutheticatoinProviders();

  Future<String> getCode(String phone) async {
    final code = await _authenticationProviders.getCode(phone);
    return code;
  }

  Future getToken(String phone, String code) async {
    final token =
        await _authenticationProviders.getToken(phone: phone, code: code);
    return "Bearer $token";
  }

  saveTokenLocaly(String token) async {
    final box = Boxes.getTokenBox();
    await box.clear();
    box.add(token);
  }
}
