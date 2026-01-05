import 'package:flutter/material.dart';
import 'package:todays_movie/util/constants/images.dart';
import 'package:get/get.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<String> plan = [
      "Free Plan",
      "Elite Subscription",
      "Premium Subscription",
    ];
    List<String> headLine = [
      "Watch your favorite movie for 3 hours daily.",
      "Watch your favorite movie for 10 hours daily.",
      "Watch your favorite movie for 24 hours a day.",
    ];
    List<String> secondHeadline = [
      "You can Download one movie every day.",
      "You can Download 5 movies every day.",
      "You can Download 20 movies every day.",
    ];
    List<String> payment = ["0.0 EGP/Mon", "50.0 EGP/Mon", "150.0 EGP/Mon"];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), Colors.purple.shade900],
            stops: [0.0, 0.4],
          ),
        ),
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Welcome in Today's Movie",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30),
              Text(
                "Choose the Plan that suites your needs including a Free Plan for everyday watching",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 40),
              SizedBox(
                height: height * 0.65,
                width: width * 0.95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width * 0.80,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 5, color: Colors.purple),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 10),
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: Image(
                              image: AssetImage(MImages.crown),
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            plan[index],
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            payment[index],
                            style: TextStyle(fontSize: 32, color: Colors.black),
                          ),
                          SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.check, color: Colors.black),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      headLine[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.check, color: Colors.black),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      secondHeadline[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 70),
                          ElevatedButton(
                            onPressed: () {
                              if (index == 1) {
                                Get.toNamed("/payment");
                              } else if (index == 2) {
                                Get.toNamed("/payment");
                              } else {
                                Get.toNamed("/home");
                              }
                            },
                            child: Text("Choose  this Plan"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
