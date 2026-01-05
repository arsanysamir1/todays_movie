import 'package:flutter/material.dart';

class MAppBarTheme {
  MAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Color(0xff3A1D4F),
    surfaceTintColor: Color(0xff3A1D4F),
    iconTheme: IconThemeData(color: Color(0xff3A1D4F), size: 24),
    actionsIconTheme: IconThemeData(color: Color(0xff3A1D4F), size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xff3A1D4F),
    ),
  );
  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Color(0xff3A1D4F),
    surfaceTintColor: Color(0xff3A1D4F),
    iconTheme: IconThemeData(color:Color(0xff3A1D4F), size: 24),
    actionsIconTheme: IconThemeData(color: Color(0xff3A1D4F), size: 24),
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
