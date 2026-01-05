import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todays_movie/features/controllers/auth_controller.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';

import '../../../util/constants/colors.dart';
import '../../../util/constants/images.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: MColors.pur700,

        child: Row(
          children: [
            InkWell(
              onTap: () {
                Get.toNamed("/home");
              },
              child: SizedBox(
                width: width / 3.3,
                child: Column(
                  children: [Icon(Icons.home, size: 35), Text("Home")],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed("/download");
              },
              child: SizedBox(
                width: width / 3.3,

                child: Column(
                  children: [Icon(Icons.save_alt, size: 35), Text("Save")],
                ),
              ),
            ),
            Container(
              width: width / 3.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MColors.pur800,
              ),
              child: Column(
                children: [Icon(Icons.person, size: 35), Text("Settings")],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), ?Colors.purple[900]],
            stops: [0.0, 0.4],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(
              height: 120,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(100),
                child: Image(
                  image: AssetImage(MImages.unknownPerson),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.waving_hand, size: 26),
                Text(
                  "  Hey ,${UserController.instance.currentUser!.getUserName()}",
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
            InkWell(onTap: () => Get.toNamed("/favorite"),child: settingsBtn(Icons.favorite, "Favorite movies")),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Get.toNamed("/saved");
              },
              child: settingsBtn(Icons.bookmark, "Saved movies"),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                AuthController.instance.logout();
              },
              child: settingsBtn(Icons.exit_to_app_outlined, "Sign Out"),
            ),
          ],
        ),
      ),
    );
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
}
