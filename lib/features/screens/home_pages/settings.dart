import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todays_movie/features/controllers/auth_controller.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';

import '../../../../util/constants/images.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff3A1D4F), Colors.purple.shade900],
          stops: [0.0, 0.4],
        ),
      ),
      child: Obx(() {
        if (UserController.instance.currentUser.value == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              SizedBox(height: 50),
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100),
                  child: getImage(
                    UserController.instance.currentUser.value!.getImage(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.waving_hand, size: 26),
                  Text(
                    "  Hey ,${UserController.instance.currentUser.value!.getUserName()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  border: Border.all(width: 3, color: Colors.purple.shade500),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 110,
                      child: Image(
                        image: AssetImage(MImages.crown),
                        color: Colors.yellow,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "You are now on the Common Account settings.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.purple.shade300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/subscription");
                      },
                      child: Text("Change Account Access"),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Get.toNamed("/manageProfile");
                },
                child: settingsBtn(Icons.person, "Manage profile info"),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () =>
                    Get.toNamed("/savedAndBookmarks", arguments: "favorite"),
                child: settingsBtn(Icons.favorite, "Favorite movies"),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Get.toNamed("/savedAndBookmarks", arguments: "saved");
                },
                child: settingsBtn(Icons.bookmark, "Saved movies"),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  AuthController.instance.logout();
                  Get.offNamed("/signIn");
                },
                child: settingsBtn(Icons.exit_to_app_outlined, "Sign Out"),
              ),
            ],
          );
        }
      }),
    );
  }
}

Image getImage(String image) {
  final file = File(image);
  if (image != MImages.unknownPerson && file.exists() == true) {

    return Image(image: FileImage(file), fit: BoxFit.fill,);

  } else {
    return Image(image: AssetImage(MImages.unknownPerson), fit: BoxFit.fill,);
  }
}

Widget settingsBtn(IconData icon, String text) {
  return Card(
    color: Colors.purple.shade700,
    child: Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(padding: EdgeInsets.only(right: 5), child: Icon(icon)),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ),
  );
}
