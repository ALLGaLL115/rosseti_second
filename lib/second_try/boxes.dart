import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/models/topic_model.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';

class Boxes {
  static Box<User> getUserBox() => Hive.box<User>("userBox");
  static Box<List<Topic>> getTopicsBox() => Hive.box<List<Topic>>("topics");
  static Box<String> getTokenBox() => Hive.box<String>("tokenBox");
}
