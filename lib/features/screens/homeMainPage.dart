import 'package:flutter/material.dart';
import 'package:todays_movie/util/constants/colors.dart';
import 'package:todays_movie/util/constants/fonts.dart';
import 'package:get/get.dart';

import 'home_pages/home_wide_images.dart';
import 'home_pages/movies_scroller.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: MColors.pur700,

        child: Row(
          children: [
            Container(
              width: width/3.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MColors.pur800,
              ),
              child: Column(
                children: [Icon(Icons.home, size: 35), Text("Home")],
              ),
            ),
            InkWell(
              onTap: (){Get.offNamed("/download");},
              child: SizedBox(
                width: width / 3.3,

                child: Column(
                  children: [Icon(Icons.save_alt, size: 35), Text("Save")],
                ),
              ),
            ),
            InkWell(
              onTap: (){Get.offNamed("/settings");},
              child: SizedBox(
                width: width / 3.3,

                child: Column(
                  children: [Icon(Icons.person, size: 35), Text("Settings")],
                ),
              ),
            ),

          ],
        ),
      ),

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
