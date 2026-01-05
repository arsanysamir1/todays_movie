import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), Colors.purple.shade900],
            stops: [0.0, 0.4],
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 20),
                      IconButton(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black54),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back,color: Colors.white,),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                          child: Text("Payment Details", style: TextStyle(color: Colors.black,fontSize: 32)),
                        ),
                      ),
                      SizedBox(height: 30),

                      Text(
                        "Free Plan:",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Plan details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
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
                                  "Watch your favorite movie for 3 hours daily.",

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
                                  "You can Download one movie every day.",

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
                      SizedBox(height: 30),
                      Text(
                        "Payment Amount:",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        "0.0 EGP",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Duration:",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        "1 Month",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),

                      SizedBox(height: 70),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/paymentMethod");
                          },
                          child: Text(
                            "Choose payment method",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),

                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.all(15),
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed("/home");
                },
                child: Text(
                  "Confirm Payment",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
