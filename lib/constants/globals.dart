import 'package:flutter/material.dart';
import 'package:rosseti_second/models/models.dart';

class Globals {
  static String _token = '';
  static Author? _user = Author.empty();
  static List<Suggestion> _suggestions = [];
  static List<String> _topics = [];
  static var _size;

  static changeToken(String token) => _token = token;
  static addUser(Author user) => _user = user;
  static addSuggestions(List<Suggestion> suggestions) =>
      _suggestions.addAll(suggestions);
  static addTopics(List<String> topics) => _topics.insertAll(0, topics);
  static takeSize(Size size) => _size = size;

  Size get size => _size;
  get token => _token;
  get user => _user;
  List<String> get topics => _topics;
  List<Suggestion> get suggesitons => _suggestions;
}
