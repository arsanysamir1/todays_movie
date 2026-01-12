import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';
class DownloadingController extends GetxController{

  RxMap<String,int> downloadRate = <String,int>{}.obs;

  Future<void> downloadMovie(String movieName) async {
    try {

      downloadRate.value[movieName]=0;
      final fileName = "Sucker Punch - Samurai Fight Scene - 4k(720P_HD).mp4";
      final String movieUrl = await Supabase.instance.client.storage
          .from("movie")
          .getPublicUrl(fileName);
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/$movieName.mp4";

      if ( UserController.instance.currentUser.value!.getDownloadedMovies().contains(
        movieName,
      )) {
        GetSnackBar(title: "File already Exists");
      } else {
        await Dio().download(
          movieUrl,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              double progress = (received / total * 100);
              downloadRate.value[movieName]=progress.toInt();
              print("$movieName Download progress: ${progress.toStringAsFixed(0)}%");
            }
          },
        );
      }
      if(downloadRate.value[movieName]==100){

        UserController.instance.currentUser.value!.addDownloadedMovie(movieName);
        UserController.instance.currentUser.value!.setDownloadedMovies();
        downloadRate.value.remove(movieName);
      }

    } catch (e) {
      print(e.toString());
    }
  }
}