import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/models/user_model.dart';

class AuthorBox {
  late Box<List<User>> _suggestionBox;

  bool haveAuthor() {
    if (_suggestionBox.isNotEmpty) return true;
    return false;
  }

  Future init() async {
    await Hive.openBox<User>("authorBox");
    _suggestionBox = Hive.box("authorBox");
  }

  void addAuthor(List<User> author) {
    _suggestionBox.add(author);
  }

  void updateAuthor(List<User> newAuthors) {
    _suggestionBox.clear();
    _suggestionBox.add(newAuthors);
  }

  void deleteAuthor() {
    _suggestionBox.clear();
  }

  void close() {
    _suggestionBox.close();
  }
}
