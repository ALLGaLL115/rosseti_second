import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';

class UserBox {
  final Box<User> userBox = Hive.box("userBox");
}
