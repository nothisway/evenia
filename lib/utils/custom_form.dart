
import 'package:flutter/material.dart';

Widget customForm(TextEditingController controller, String text, {bool hidden = false}){
  return TextFormField(
    controller: controller,
    cursorColor: Colors.blue,
    obscureText: hidden,
    decoration: InputDecoration(
      labelText: text,
      // labelStyle: TextStyle(color: CustomColors.firebaseYellow),
      hintText: text,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(0.5),
      ),
      errorStyle: const TextStyle(
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.amber,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    ),
  );
}