import 'package:rosseti_second/second_try/boxes.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';
import 'package:rosseti_second/second_try/providers/data_providers.dart';

class UserRepository {
  final DataProviders dataProviders = DataProviders();
  Future<User> getUser() async {
    final user = await dataProviders.getUser();
    return user;
  }

  saveUser(User user) {
    final userBox = Boxes.getUserBox();
    userBox.clear();
    userBox.add(user);
  }
}
