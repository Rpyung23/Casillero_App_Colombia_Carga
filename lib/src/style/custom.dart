import 'package:flutter/material.dart';
import 'package:locker/src/style/theme.dart' as Style;

InputDecoration styleInput(String label, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Colors.black26, size: 18.0),
    enabledBorder: OutlineInputBorder(
      borderSide: new BorderSide(color: Colors.black12),
      borderRadius: BorderRadius.circular(25.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: new BorderSide(color: Colors.red.shade600),
      borderRadius: BorderRadius.circular(25.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: new BorderSide(color: Colors.red.shade600),
      borderRadius: BorderRadius.circular(25.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: new BorderSide(color: Style.Colors.mainColor),
      borderRadius: BorderRadius.circular(25.0),
    ),
    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
    labelText: label,
    hintStyle: TextStyle(
        fontSize: 14.0, color: Style.Colors.grey, fontWeight: FontWeight.w500),
    labelStyle: TextStyle(
        fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w500),
  );
}
