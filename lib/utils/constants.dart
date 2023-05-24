import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors {
  static var foregroundColor = Colors.greenAccent;
  static var baseColor = Colors.white70;
  static var whiteColor = Colors.white;
  static var greyColor = Colors.grey;
}

class MyFontStyle {
  static var kFontStyle = GoogleFonts.poppins(fontSize: 16);
}

Widget progressIndicator = CircularProgressIndicator(
  color: MyColors.foregroundColor,
  strokeWidth: 4,
);

toastMessage(String message) {
  return Fluttertoast.showToast(msg: message);
}
