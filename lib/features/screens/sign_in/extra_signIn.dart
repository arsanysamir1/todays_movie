import 'package:flutter/material.dart';

import '../../../../util/constants/colors.dart';
import '../../../../util/constants/images.dart';


class extraSignIn extends StatelessWidget {
  const extraSignIn({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: [
            Container(
              width: width / 4,
              height: 2,
              color: Colors.white,
            ),
            Container(
              child: Text(
                "Or Sign In With",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              width: width / 4,
              height: 2,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 30),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: width / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 60,
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: MColors.pur800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      image: AssetImage(MImages.coloredFacebookIcon),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 60,
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:MColors.pur800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      image: AssetImage(MImages.coloredGoogleIcon),
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){} ,
                  child: Container(
                    height: 60,
                    width: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: MColors.pur800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      image: AssetImage(MImages.whiteAppleIcon),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
