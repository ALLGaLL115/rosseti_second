import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

inputFieldLarge(
    {required String titleText,
    String? initialInputText,
    Function(String value)? onChange,
    bool? readOnly}) {
  return Column(
    children: [
      Text(
        titleText,
        style: standart,
      ),
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          initialValue: initialInputText ?? "",
          readOnly: readOnly ?? false,
          minLines: 10,
          maxLines: 10,
          onChanged: (value) {
            if (onChange != null) {
              onChange(value);
            }
          },
          style: standart,
          decoration: const InputDecoration(border: InputBorder.none),
        ),
      ),
    ],
  );
}