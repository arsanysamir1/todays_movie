
import 'package:flutter/material.dart';
import 'package:todays_movie/features/screens/welcome/changeables.dart';
import 'package:todays_movie/features/screens/welcome/welcome_image_card.dart';

import 'package:todays_movie/util/constants/images.dart';



class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              left: -20,
              top: -55,
              child: Transform.rotate(
                angle: -0.15,
                child: Container(
                  height: height * 0.62,
                  width: width * 1.5,
                  color: Color(0xff4A3554),
                  child: Row(
                    children: [
                      ImagesColumn(column1: MImages.column1,),
                      ImagesColumn(column1: MImages.column2,),
                      ImagesColumn(column1: MImages.column3,),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: height * 0.3,
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xff4A3554),
                      Color(0xff3A1D4F),
                      Color(0xff130c22),
                    ],
                    stops: [0.0, 0.1, 0.2, 0.5],
                  ),
                 
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 210),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      changeText(),
                      Center(child: Container(margin: EdgeInsets.all(8))),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              width: width,
              top: height * 0.33,
              child: Center(
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: AssetImage(MImages.purpleIcon),
                    width: 130,
                    height: 130,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
