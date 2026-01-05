
import 'package:flutter/material.dart';


class MElevatedButtonTheme{
  MElevatedButtonTheme._();

  static final lightElevatedButtonTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.purple.shade700,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.purple.shade700),
      padding: EdgeInsets.symmetric(vertical: 18,horizontal: double.infinity),
      textStyle:TextStyle().copyWith(fontSize: 32,color: Colors.white,fontWeight:FontWeight.w600,)

    )
  );
  static final darkElevatedButtonTheme=ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
          foregroundColor: Colors.white,
          backgroundColor:Colors.purple.shade700,
          disabledForegroundColor: Colors.grey,
          disabledBackgroundColor: Colors.grey,
          side: BorderSide(color: Colors.purple.shade700),
          textStyle:TextStyle(fontSize: 24,color: Colors.white,fontWeight:FontWeight.w600,)

      )
  );
}