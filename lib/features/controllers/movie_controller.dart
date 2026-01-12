
import 'package:get/get.dart';


import 'package:todays_movie/features/controllers/user_controller.dart';
import 'package:todays_movie/features/modules/movie.dart';

class MovieController extends GetxController {
  final String search;

  MovieController({required this.search});

  late RxBool favorite =  UserController.instance.currentUser.value!
      .getFavoriteMovies()
      .contains(search)
      .obs;
  late RxBool save =  UserController.instance.currentUser.value!
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
    if ( UserController.instance.currentUser.value!.getSavedMovies().contains(
      newMovie.getMovieName(),
    )) {
       UserController.instance.currentUser.value!.removeSavedMovie(
        newMovie.getMovieName(),
      );
       UserController.instance.currentUser.value!.setSavedMovies();
    } else {
       UserController.instance.currentUser.value!.addSavedMovie(
        newMovie.getMovieName(),
      );
       UserController.instance.currentUser.value!.setSavedMovies();
    }
  }

  void ChangeFavorite(Movie newMovie) {
    favorite.value = !favorite.value;
    if ( UserController.instance.currentUser.value!.getFavoriteMovies().contains(
      newMovie.getMovieName(),
    )) {
       UserController.instance.currentUser.value!.removeFavoriteMovie(
        newMovie.getMovieName(),
      );
       UserController.instance.currentUser.value!.setFavoriteMovies();
    } else {
       UserController.instance.currentUser.value!.addFavoriteMovie(
        newMovie.getMovieName(),
      );
       UserController.instance.currentUser.value!.setFavoriteMovies();
    }
  }


}
