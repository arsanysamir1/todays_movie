import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todays_movie/features/screens/home_pages/download.dart';
import 'package:todays_movie/features/screens/home_pages/settings.dart';
import 'package:todays_movie/features/screens/home_pages/homeMainPage.dart'; // Ensure this matches your file name
import '../../util/constants/colors.dart';
import '../controllers/home_pages_controller.dart';
import '../controllers/user_controller.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final controller = Get.put(HomePagesController());

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: MColors.pur700,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomBarButton(
                controller: controller,
                width: width,
                text: "Home",
                icon: Icons.home,
                index: 0,
              ),
              bottomBarButton(
                controller: controller,
                width: width,
                text: "Download",
                icon: Icons.save_alt,
                index: 1,
              ),
              bottomBarButton(
                controller: controller,
                width: width,
                text: "Settings",
                // Fixed text
                icon: Icons.person,
                index: 2,
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {

          return IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(), // Index 0
               Download(key: ValueKey(controller.downloadTrigger.value),), // Index 1
              const Settings(), // Index 2
            ],
          );
        }
      ),
    );
  }

  Widget bottomBarButton({
    required HomePagesController controller,
    required double width,
    required String text,
    required IconData icon,
    required int index,
  }) {
    // Check if this button is the currently selected index
    final bool isSelected = controller.pageIndex.value == index;

    return InkWell(
      onTap: () {controller.changePage(index);} ,
      child: Container(
        width: width / 3.3,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // Show MColors.pur800 only if active, otherwise transparent
          color: isSelected ? MColors.pur800 : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.white : Colors.white70,
            ),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
