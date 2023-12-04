import 'package:flutter/material.dart';
import 'package:rosseti_second/colors.dart';
import 'package:rosseti_second/strings.dart';

class InputLargeField extends StatelessWidget {
  final String titleText;

  final String? initialInputText;
  final Function(String value)? onChange;
  final bool? readOnly;
  const InputLargeField(
      {super.key,
      required this.titleText,
      this.initialInputText,
      this.onChange,
      this.readOnly});

  @override
  Widget build(BuildContext context) {
    return inputFieldLarge(titleText: titleText);
  }
}

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
        margin: const EdgeInsets.symmetric(vertical: 8),
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
