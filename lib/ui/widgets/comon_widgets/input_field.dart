import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

class InputField extends StatefulWidget {
  final String? initialText;
  final String? hintText;
  final Function(String value)? onChange;
  final TextEditingController? controller;
  const InputField({
    super.key,
    this.initialText,
    this.hintText,
    this.onChange,
    this.controller,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String? initialText;
  String? hintText;
  Function(String value)? onChange;
  TextEditingController? controller;
  @override
  void initState() {
    // TODO: implement initState
    initialText = widget.initialText;
    hintText = widget.hintText;
    onChange = widget.onChange;
    controller = widget.controller;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(color: mainColor, width: 2),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 0.1,
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          controller: controller,
          onChanged: (value) => onChange!(value),
          initialValue: initialText,
          decoration: textFieldInputDecoration(hintText: hintText),
        ));
  }
}

final textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: mainColor, width: 2));

textFieldInputDecoration({String? hintText}) {
  return InputDecoration(
    errorBorder: textFieldBorder,
    enabledBorder: textFieldBorder,
    focusedBorder: textFieldBorder,
    disabledBorder: textFieldBorder,
    focusedErrorBorder: textFieldBorder,
    hintText: hintText,
    hintStyle: const TextStyle(
        fontWeight: FontWeight.w400, fontSize: 20, color: Colors.grey),
    border: InputBorder.none,
  );
}
