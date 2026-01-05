import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';
import 'package:todays_movie/features/modules/movie.dart';
import 'package:todays_movie/features/modules/movies.dart';

class DownloadController extends GetxController {
  // Reactive list of downloaded movies
  RxList<Movie> reactMovies=<Movie>[].obs;

  List<Movie> movies;

  DownloadController(this.movies);

  @override
  void onInit() {
    super.onInit();
    reactMovies.value=movies;
  }

  // Find all .mp4 files in the app directory


  // Delete the file and update the UI
  Future<void> deleteMovie(String movieName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = File("${directory.path}/$movieName.mp4");

      if (await filePath.exists()) {
        await filePath.delete(); // Physically delete from storage
        movies.removeWhere((element) => element.getMovieName()==movieName,); // Remove from reactive list to update UI

        Get.snackbar(
          "Deleted",
          "Movie removed from downloads",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white24,
          colorText: Colors.white,
        );
        UserController.instance.currentUser!.removeDownloadedMovie(movieName);
        UserController.instance.currentUser!.setDownloadedMovies();
        reactMovies.value=movies;
      }
    } catch (e) {
      Get.snackbar("Error", "Could not delete file: $e");
    }
  }
}