import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(left: 10),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
