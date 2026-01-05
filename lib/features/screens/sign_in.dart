import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todays_movie/features/screens/sign_in/signin_form.dart';
import 'package:todays_movie/util/constants/images.dart';


class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff3A1D4F), Color(0xff250051)],
          stops: [0.0, 0.4],
        ),
      ),
      child: Container(
        width: width,
        height: width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              height: 100,
              width: 100,

              child: Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(MImages.purpleIcon),
              ),
            ),
            SizedBox(height: 60),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Material(
                  color: Colors.transparent,

                  child: signInForm(width: width),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


