import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/constants/colors.dart';
import '../controllers/download_controller.dart';
import '../controllers/user_controller.dart';
import '../modules/movie.dart';
import '../modules/movies.dart';

class Download extends StatelessWidget {
  const Download({super.key});


  @override
  Widget build(BuildContext context) {
    List<Movie> movies = [];

    Movies.movies.forEach((element) {
      if (UserController.instance.currentUser!.getDownloadedMovies().contains(
        element.getMovieName(),
      )) {
        movies.add(element);
      }
    });
    final controller=Get.put(DownloadController(movies));
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
            Container(
              width: width / 3.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MColors.pur800,
              ),
              child: Column(
                children: [Icon(Icons.save_alt, size: 35), Text("Downloads")],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed("/settings");
              },
              child: SizedBox(
                width: width / 3.3,
                child: Column(
                  children: [Icon(Icons.person, size: 35), Text("Settings")],
                ),
              ),
            ),
          ],
        ),
      ),
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
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 20),


                  Center(
                    child: Text(
                      "Downloaded Movies",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: width,
                    height: height,
                    child:Obx(() => ListView.builder(
                      itemCount: controller.reactMovies.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Obx(
                          () =>  MovieCard(
                            movie: controller.reactMovies.value,
                            width: width,
                            index: index,
                          ),
                        ); }, )

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.width,
    required this.index,
  });



  final List<Movie> movie;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(DownloadController(movie));
    return InkWell(
      onTap: () {
        Get.toNamed("/playMovie",arguments:["",movie[index].getMovieName()]);
      },
      child: Card(
        color: Colors.purple.shade800,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(movie[index].getMainImage()),
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: SizedBox(
                height: 140,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width / 2,
                              child: Text(
                                movie[index].getMovieName().length > 40
                                    ? "${movie[index].getMovieName().substring(
                                            0,
                                            40,
                                          )}..."
                                    : movie[index].getMovieName(),
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text("  ${movie[index].getRating()}"),
                                Text("  (${movie[index].getViews()})"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                       InkWell(
                          onTap: () {
                            controller.deleteMovie(movie[index].getMovieName());

                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.delete),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
