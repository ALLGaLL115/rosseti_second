import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

RatingBar builderRaiting(void getRaiting(double value)) {
  return RatingBar.builder(
      initialRating: 4,
      glowColor: Colors.amber,
      unratedColor: Colors.grey.withOpacity(0.3),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.all(8),
      itemSize: 40,
      itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
      onRatingUpdate: (ratingValue) {
        getRaiting(ratingValue);
      });
}
