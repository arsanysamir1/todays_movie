import 'package:flutter/material.dart';
import 'package:todays_movie/features/controllers/movie_controller.dart';
import 'package:todays_movie/features/controllers/search_controller.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../modules/movie.dart';
import '../modules/movies.dart';

class MoviePage extends StatelessWidget {
  final String name;

  MoviePage({super.key, required this.name});

  final movieUrl =
      "https://yintwvfoovprywajvtrw.supabase.co/storage/v1/object/public/movie/Sucker%20Punch%20-%20Samurai%20Fight%20Scene%20-%204k(720P_HD).mp4";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    late Movie newMovie;
    Movies.movies.forEach((element) {
      if (element.compareName(name)) {
        newMovie = element;
      }
    });
    final controller = Get.put(Searchcontroller());
    final Mcontroller = Get.put(MovieController(search: name));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), ?Colors.purple[900]],
            stops: [0.0, 0.4],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height * 0.6,
                  child: ClipRRect(
                    child: Image(
                      image: NetworkImage(newMovie.getMainImage()),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: width,
                  height: height * 0.3,
                  margin: EdgeInsets.only(top: height * 0.3),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, ?Colors.purple[900]],
                      stops: [0.0, 0.8],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Get.toNamed("/playMovie", arguments: [movieUrl,""]);
                  },
                  child: SizedBox(
                    height: height * 0.6,
                    width: width,
                    child: Icon(
                      Icons.play_circle,
                      size: 80,
                      color: Colors.white70,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.previousRoute == "/home"
                              ? controller.clear()
                              : print("");
                          Get.back();
                        },
                        child: Container(
                          height: height * 0.05,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Mcontroller.ChangeFavorite(newMovie);
                          UserController.instance.currentUser!
                              .getFavoriteMovies()
                              .forEach((element) {
                                print(element);
                              });
                          print("----------------------");
                        },
                        child: Obx(
                          () => Container(
                            height: height * 0.05,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(
                              Mcontroller.favorite.value == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  margin: EdgeInsets.only(left: 10, top: height * 0.54),
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        child: Text(
                          newMovie.getMovieName(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Release Date : ${newMovie.getReleaseDate()}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            fontWeight: FontWeight.w700,
                          ),
                          Text(
                            "  ${newMovie.getDuration()}   ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w700,
                          ),
                          Text(
                            "  ${newMovie.getRating()} ",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            "  (${newMovie.getViews()} views)",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),
                      Row(
                        children: List.generate(newMovie.getGenres().length, (
                          index,
                        ) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.only(right: 10),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                newMovie.getGenres()[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.purple[400],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple[400],
                            ),
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed("/playMovie", arguments: [movieUrl,""]);

                              },
                              child: Text(
                                "Watch now",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(color: Colors.white),
                            child: TextButton(
                              onPressed: () {
                                Mcontroller.downloadMovie(
                                  newMovie.getMovieName(),
                                );
                              },
                              child: Text(
                                "Download",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          ElevatedButton(
                            onPressed: () {
                              Mcontroller.ChangeSave(newMovie);
                              UserController.instance.currentUser!
                                  .getSavedMovies()
                                  .forEach((element) {
                                    print(element);
                                  });
                              print("----------------------");
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.purple[200],
                              ),
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                            child: Obx(
                              () => Icon(
                                Mcontroller.save == true
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                fontWeight: FontWeight.w600,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),
                      SizedBox(
                        width: width,
                        child: Text(
                          "Story :",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width,
                        child: Text(
                          newMovie.getDisc(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
