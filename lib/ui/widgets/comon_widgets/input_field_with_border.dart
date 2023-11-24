import 'package:flutter/material.dart';
import 'package:rosseti_second/strings.dart';

inputFieldWithBorder(BuildContext context, Function(String value) onChange) {
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
    clipBehavior: Clip.hardEdge,
    child: TextFormField(
      // controller: controller,
      onChanged: (value) => onChange(value),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "phone_string",
        hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        counterText: "",
      ),
      maxLength: 18,
      keyboardType: TextInputType.phone,
    ),
  );
}
