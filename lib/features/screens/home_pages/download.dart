import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/downloaded_controller.dart';
import '../../controllers/user_controller.dart';
import '../../modules/movie.dart';

class Download extends StatelessWidget {
    const Download({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DownloadedController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), ?Colors.purple[900]],
            stops: [0.0, 0.4],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
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
                    Obx(() {
                      if (UserController.instance.currentUser.value == null) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.movies.isEmpty) {
                        return Container();
                      } else {
                        
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.movies.value.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final movie=controller.movies.value[index];
                            return MovieCard(
                              movie: movie,
                              width: width,
                              index: index,
                              callback: () {
                                final user = UserController.instance.currentUser;

                                user.value!.removeDownloadedMovie(
                                  movie.getMovieName(),
                                );
                                user.value!.setDownloadedMovies();
                                user.refresh();

                                controller.deleteMovie(
                                  movie.getMovieName(),
                                );

                                controller.movies.refresh();
                              },
                            );
                          },
                        );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
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
    required this.callback,
  });

  final Movie movie;
  final double width;
  final int index;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Movie name ${movie.getMovieName()}");

        Get.toNamed("/movie", arguments:  movie.getMovieName());
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
                  image: NetworkImage( movie.getMainImage()),
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
                            SizedBox(
                              width: width / 2,
                              child: Text(
                                 movie.getMovieName().length > 40
                                    ? "${ movie.getMovieName().substring(0, 40)}..."
                                    :  movie.getMovieName(),
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text("  ${ movie.getRating()}"),
                                Text("  (${ movie.getViews()})"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            callback();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.delete),
                          ),
                        ),
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
