import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:todays_movie/features/controllers/user_controller.dart';
import 'package:todays_movie/features/modules/movie.dart';

class MovieController extends GetxController {
  final String search;

  MovieController({required this.search});

  late RxBool favorite = UserController.instance.currentUser!
      .getFavoriteMovies()
      .contains(search)
      .obs;
  late RxBool save = UserController.instance.currentUser!
      .getSavedMovies()
      .contains(search)
      .obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

  void ChangeSave(Movie newMovie) {
    save.value = !save.value;
    if (UserController.instance.currentUser!.getSavedMovies().contains(
      newMovie.getMovieName(),
    )) {
      UserController.instance.currentUser!.removeSavedMovie(
        newMovie.getMovieName(),
      );
      UserController.instance.currentUser!.setSavedMovies();
    } else {
      UserController.instance.currentUser!.addSavedMovie(
        newMovie.getMovieName(),
      );
      UserController.instance.currentUser!.setSavedMovies();
    }
  }

  void ChangeFavorite(Movie newMovie) {
    favorite.value = !favorite.value;
    if (UserController.instance.currentUser!.getFavoriteMovies().contains(
      newMovie.getMovieName(),
    )) {
      UserController.instance.currentUser!.removeFavoriteMovie(
        newMovie.getMovieName(),
      );
      UserController.instance.currentUser!.setFavoriteMovies();
    } else {
      UserController.instance.currentUser!.addFavoriteMovie(
        newMovie.getMovieName(),
      );
      UserController.instance.currentUser!.setFavoriteMovies();
    }
  }

  RxBool isDownloading = false.obs;
  RxDouble downloadRate = 0.0.obs;

  Future<void> downloadMovie(String movieName) async {
    try {
      isDownloading.value = true;
      downloadRate.value = 0.0;
      final fileName = "Sucker Punch - Samurai Fight Scene - 4k(720P_HD).mp4";
      final String movieUrl = await Supabase.instance.client.storage
          .from("movie")
          .getPublicUrl(fileName);
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/$movieName.mp4";

      if (UserController.instance.currentUser!.getDownloadedMovies().contains(
        movieName,
      )) {
        GetSnackBar(title: "File already Exists");
      } else
        await Dio().download(
          movieUrl,
          filePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              double progress = (received / total * 100);
              print("Download progress: ${progress.toStringAsFixed(0)}%");
            }
          },
        );
      UserController.instance.currentUser!.addDownloadedMovie(movieName);
      UserController.instance.currentUser!.setDownloadedMovies();
    } catch (e) {
      print(e.toString());
    }
  }
}
