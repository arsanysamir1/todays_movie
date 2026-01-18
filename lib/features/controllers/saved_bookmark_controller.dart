import 'package:get/get.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';
import 'package:todays_movie/features/modules/movie.dart';

import '../modules/movies.dart';

class SavedBookmarkController  extends GetxController{
  RxList<Movie> movies=<Movie>[].obs;
  String root;
  SavedBookmarkController(this.root);
  @override
  void onInit() {
    movies.value=[];
    root=="saved"? InitiateSavedMovie():InitiateFavoriteMovie();
    super.onInit();
  }
  void InitiateFavoriteMovie(){
    for (var element in Movies.movies) {
      if ( UserController.instance.currentUser.value!.getFavoriteMovies().contains(
        element.getMovieName(),
      )) {
        movies.value.add(element);
      }
    }
  }
  void InitiateSavedMovie(){
    Movies.movies.forEach((element) {
      if ( UserController.instance.currentUser.value!.getSavedMovies().contains(
        element.getMovieName(),
      )) {
        movies.value.add(element);
      }
    });
  }
}