
import 'package:flutter/material.dart';
import 'package:todays_movie/util/constants/colors.dart';

class MTextFieldTeme {
  MTextFieldTeme._();

  final InputDecorationThemeData lightInputDecorationTheme =
      InputDecorationThemeData(
        errorMaxLines: 3,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        labelStyle: const TextStyle().copyWith(
          fontSize: 14,
          color: MColors.Cyan500,
        ),
        hintStyle: const TextStyle().copyWith(
          fontSize: 14,
          color: MColors.Cyan500,
        ),
        errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
        floatingLabelStyle: TextStyle().copyWith(
          color: Colors.black.withOpacity(0.8),
        ),
        border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey),
        ),
      );
}
