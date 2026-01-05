import 'package:flutter/material.dart';

import '../../../../util/constants/fonts.dart';
import '../../../../util/constants/welcome.dart';
import 'package:get/get.dart';

import '../../controllers/welcome_controller.dart';



class changeText extends StatelessWidget {
  const changeText({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final controller = Get.put(WelcomeController());
    return Column(
      children: [
        Container(
          height: 300,
          margin: EdgeInsets.all(5),
          width: width,
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            controller: controller.pageController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Page(height, width, index);
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: height * 0.012),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    controller.skipPage();
                  },

                  child: Text("Skip", style: TextStyle(fontSize: 22)),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.nextPage();
                  print(controller.pageController.offset);
                },
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Page(height, width, index) {
    final Title = [Welcome.firstTitle, Welcome.secondTitle, Welcome.thirdTitle];
  final text = [Welcome.firstText, Welcome.secondText, Welcome.thirdText];
    final controller = Get.put(WelcomeController());
    return Container(
      height: 200,
      width: width,
      child: Column(
        children: [
           Text(
            Title[index],
            style: TextStyle(fontSize: 32, fontFamily: MFonts.openSans),
          ),
          SizedBox(height: height * 0.02),
          Text(
            text[index],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontFamily: MFonts.openSans),
          ),
          Center(
            child: SizedBox(
              height: 100,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Row(
                    children: [
                      Container(
                        height: 10,
                        width: controller.currentPageIndex.value == index ? 30 : 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
