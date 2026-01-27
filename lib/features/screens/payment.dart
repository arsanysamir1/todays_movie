import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todays_movie/features/controllers/hive_controller.dart';

import '../controllers/payment_controller.dart';

class Payment extends StatelessWidget {
  final String plan;
  final double price;

  const Payment({super.key, required this.plan, required this.price});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = Get.put(PaymentController());

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 20),
                      IconButton(
                        padding: EdgeInsets.all(15),
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),

                          child: Text(
                            "Payment Details",
                            style: TextStyle(color: Colors.black, fontSize: 32),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      Text(
                        "$plan Plan:",
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
                        "$price EGP",
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
                      SizedBox(height: 10),
                      Text(
                        "Payment Method:",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),

                      SizedBox(height: 30),
                      Obx(
                        () => controller.cardInfo.isEmpty
                            ? Container(
                                margin: EdgeInsets.all(10),
                                width: width,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    controller.cardInfo.value =
                                        await Get.toNamed("/paymentMethod");
                                  },
                                  child: Text(
                                    "Choose payment method",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  controller.cardInfo.value = await Get.toNamed(
                                    "/paymentMethod",
                                  );
                                },
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.purple.shade700,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.cardInfo.value[0],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "${controller.cardInfo.value[1]} **** **** ****",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
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
                  if (controller.cardInfo.isEmpty) {
                    Get.snackbar(
                      "Payment Method",
                      "Please choose your payment Method",
                      backgroundColor: Colors.black45,

                    );
                  } else {
                    Get.toNamed("/homePages");
                    MyHive.setNewValue(key: 'userTier', value: true);
                  }
                },
                child: Text("Confirm Payment", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
