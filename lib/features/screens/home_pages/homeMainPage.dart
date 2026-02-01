import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:todays_movie/util/constants/fonts.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import 'home/home_wide_images.dart';
import 'home/movies_scroller.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    Get.put(AuthController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(


      body: SizedBox(
        height: height,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.5),

                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff3A1D4F), ?Colors.purple[900]],
                      stops: [0.0, 0.4],
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 15, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Popular Movies",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: MFonts.openSans,
                          ),
                        ),
                        MoviesScroller(),
                        Text(
                          "Top Rated",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: MFonts.openSans,
                          ),
                        ),
                        MoviesScroller()
                        ,
                      ],
                    ),
                  ),
                ),
                wideImages(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
