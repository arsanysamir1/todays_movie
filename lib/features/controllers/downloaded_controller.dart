import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';
import 'package:todays_movie/features/modules/movie.dart';
import 'package:todays_movie/features/modules/movies.dart';

class DownloadedController extends GetxController {
  // Reactive list of downloaded movies
  RxList<Movie> movies = <Movie>[].obs;
  RxList<Movie> downloadingMovies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (UserController.instance.currentUser.value != null) {

      InitiateDownloadedMovie();

    }else{
      print("user isn't initialized");
    }

  }

  // void InitiateDownloadingMovie(){
  //   downloadingMovies.clear();
  //   Movies.movies.forEach((element) {
  //     DownloadingController().downloadRate.keys.forEach((delement) {
  //       if (element.getMovieName()==delement) {
  //         downloadingMovies.value.add(element);
  //       }
  //     },);
  //   });
  //   downloadingMovies.value.forEach((element) => print("this is being downloaded"+element.getMovieName()),);
  // }
  // Find all .mp4 files in the app directory

  void InitiateDownloadedMovie() {
    movies.clear();

    print("--- downloaded movies ---");
    Movies.movies.forEach((element) {
      if (UserController.instance.currentUser.value!
          .getDownloadedMovies()
          .contains(element.getMovieName())) {
        movies.value.add(element);
        print(element.getMovieName());
      }
    });

    print("-------------------");
    movies.refresh();
  }

  // Delete the file and update the UI
  Future<void> deleteMovie(String movieName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = File("${directory.path}/$movieName.mp4");

      if (await filePath.exists()) {
        await filePath.delete(); // Physically delete from storage
        Get.snackbar(
          "Deleted",
          "Movie removed from downloads",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white24,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Could not delete file: $e");
    }
  }
}
