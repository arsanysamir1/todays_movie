import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import '../../util/constants/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = Get.put(Searchcontroller());

    return Scaffold(
      body: Container(
        width: width,
        padding: EdgeInsets.only(top: 10),
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff3A1D4F), Colors.purple.shade900],
            stops: [0.0, 0.4],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(margin: EdgeInsets.only(top: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                        controller.clear();
                      },
                      icon: Icon(Icons.arrow_back_rounded),
                    ),
                    SizedBox(
                      width: width*0.85,
                      child: TextFormField(
                        controller: controller.searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white38,
                          label: Text("Search"),
                          hint: Text(
                            "Enter the movie's name",
                            style: TextStyle(color: MColors.pur600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: width,
                height: height * 0.9,
                child: ListView.builder(
                  itemCount: controller.searchMovies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(
                      controller: controller,
                      width: width,
                      index: index,
                    );
                  },
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
    required this.controller,
    required this.width,
    required this.index,
  });

  final Searchcontroller controller;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          "/movie",
          arguments: controller.searchMovies[index].getMovieName(),
        );
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
                  image: NetworkImage(
                    controller.searchMovies[index].getMainImage(),
                  ),
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
                                controller.searchMovies[index]
                                            .getMovieName()
                                            .length >
                                        40
                                    ? controller.searchMovies[index]
                                              .getMovieName()
                                              .substring(0, 40) +
                                          "..."
                                    : controller.searchMovies[index]
                                          .getMovieName(),
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text(
                                  "  " +
                                      controller.searchMovies[index]
                                          .getRating(),
                                ),
                                Text(
                                  "  (${controller.searchMovies[index].getViews()})",
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: (){},
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
                        controller.searchMovies[0].getDisc().length > 12
                            ? controller.searchMovies[0].getDisc().substring(
                                    0,
                                    100,
                                  ) +
                                  "..."
                            : controller.searchMovies[0].getDisc(),
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
