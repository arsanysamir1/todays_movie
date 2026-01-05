import 'package:flutter/material.dart';
import 'package:todays_movie/util/constants/colors.dart';

class MOutlinedButtonTheme {
  MOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style:OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        side: BorderSide(color: MColors.Cyan500),
        textStyle: TextStyle(color: Colors.black),
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(14))

      )
  );
  static OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style:OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          side: BorderSide(color: MColors.Cyan500),
          textStyle: TextStyle(color: Colors.white),
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(14))

      )
  );
}