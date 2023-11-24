import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

import '../../../second_try/models/message.dart';

SizedBox chatGroupSeparatorWidget(DateTime date) {
  return SizedBox(
    height: 40,
    width: 100,
    child: Center(
      child: Card(
        color: mainColor.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(formatDate(date, [d, " ", MM, " ", yyyy])),
        ),
      ),
    ),
  );
}
