import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todays_movie/features/controllers/user_controller.dart';
import 'package:todays_movie/features/modules/movies.dart';
import '../../modules/movie.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Movie> movies = [];
    Movies.movies.forEach((element) {
      if (UserController.instance.currentUser!.getFavoriteMovies().contains(
        element.getMovieName(),
      )) {
        movies.add(element);
      }
    });
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
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 20),
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black54),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),

                  Center(
                    child: Text(
                      "Favorite Movies",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: width,
                    height: height,
                    child: ListView.builder(
                      itemCount: movies.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movie: movies,
                          width: width,
                          index: index,
                        );
                      },
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
    return InkWell(
      onTap: () {
        print("Movie name " + movie[index].getMovieName());

        Get.toNamed("/movie", arguments: movie[index].getMovieName());
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
              child: Container(
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
                                    ? movie[index].getMovieName().substring(
                                  0,
                                  40,
                                ) +
                                    "..."
                                    : movie[index].getMovieName(),
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text("  " + movie[index].getRating()),
                                Text("  (${movie[index].getViews()})"),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(Icons.favorite),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Text(
                        movie[index].getDisc().length > 12
                            ? movie[index].getDisc().substring(0, 100) + "..."
                            : movie[index].getDisc(),
                      ),
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
