import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:rosseti_second/second_try/providers/rating_providers.dart';
import 'package:rosseti_second/ui/pages/chat_page.dart';

class RatingCubit extends Cubit<int> {
  late final RatingProvider _raringProvider;
  RatingCubit({required RatingProvider ratingProvider})
      : _raringProvider = ratingProvider,
        super(0);

  updateRaitng({required int rating}) {
    emit(rating);
  }

  postRating({required int suggestionId, required BuildContext context}) async {
    if (state != 0) {
      final res = await _raringProvider.addRating(
          suggestionId: suggestionId, value: state);

      res.fold((l) => print("ffoffof ${l.toString()}"), (r) {
        print("raing sended is $r");

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatPage(
                  suggestionId: suggestionId,
                )));
      });
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatPage(
                suggestionId: suggestionId,
              )));
    }
  }
}
