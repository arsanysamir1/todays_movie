import 'package:get/get.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';

import 'downloaded_controller.dart';
class HomePagesController extends GetxController {
  final RxInt pageIndex = 0.obs;
  final RxInt downloadTrigger = 0.obs;

  void changePage(int index) {
    print("Method changePage called for index: $index"); // Debug print

    if (index == 1) {
      try {
        if(UserController.instance.currentUser.value==null){
          print("user isn't initialized");
        }else{
          print("user is initialized");
        }
        Get.find<DownloadedController>().InitiateDownloadedMovie();

        downloadTrigger.value++;
      } catch (e) {
        // In case the controller hasn't been initialized yet
        print("DownloadedController not yet in memory");
      }

    }

    pageIndex.value = index;

  }
}
