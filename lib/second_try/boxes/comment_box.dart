import 'package:hive/hive.dart';
import 'package:rosseti_second/second_try/models/comment_model.dart';

class CommentsBox {
  late Box<List<List<Comment>>> _commentBox;

  Future init() async {
    await Hive.openBox<List<List<Comment>>>("commentBox");
    _commentBox = Hive.box<List<List<Comment>>>("commentBox");
  }

  bool haveComment() {
    if (_commentBox.isNotEmpty) return true;
    return false;
  }

  void addComments(List<List<Comment>> comment) {
    _commentBox.put("commentsListList", comment);
  }

  void updateComment(List<List<Comment>> comment) {
    _commentBox.delete('commentsListList');
    _commentBox.put('commentsListList', comment);
  }

  void deleteComment() {
    _commentBox.delete('commentsListList');
  }

  void deleteAllComments() {
    _commentBox.clear();
  }

  void closeComment() {
    _commentBox.close();
  }
}
