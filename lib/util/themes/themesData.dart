import 'package:flutter/material.dart';
import 'package:todays_movie/util/constants/fonts.dart';
import 'package:todays_movie/util/themes/custom_themes/app_bar_theme.dart';
import 'package:todays_movie/util/themes/custom_themes/elevated_button_theme.dart';
import 'package:todays_movie/util/themes/custom_themes/outlined_button_theme.dart';
import 'package:todays_movie/util/themes/custom_themes/text_themes.dart';

import '../constants/colors.dart';
class MAppTheme{
  MAppTheme._();
  static ThemeData lightTheme= ThemeData(
    useMaterial3: true,
    fontFamily: MFonts.openSans,
    brightness: Brightness.light,
    primaryColor: MColors.Cyan500,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MTextThemes.lightTextTheme,
    elevatedButtonTheme:MElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme:MAppBarTheme.lightAppBarTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,

  );
  static ThemeData darkTheme= ThemeData(
    useMaterial3: true,
    fontFamily: MFonts.openSans,
    brightness: Brightness.dark,
    primaryColor: MColors.Cyan500,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MTextThemes.darkTextTheme,
    elevatedButtonTheme:MElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme:MAppBarTheme.darkAppBarTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    //inputDecorationTheme: MTextThemes.darkTextTheme,
  );

}