
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../../../util/constants/colors.dart';

import '../../modules/movies.dart';
import '../../controllers/search_controller.dart';

class wideImages extends StatelessWidget {
  const wideImages({super.key});


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final controller = Get.put(Searchcontroller());
    return Stack(
      children: [
        Container(
          height: height * 0.5,
          width: width,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(width: width,
                child: Image(
                  image: NetworkImage(Movies.movies[index].getMainImage()),
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
        ),

        Positioned(
          top: height / 2.5,
          child: Container(
            height: height * 0.1,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                stops: [0.0, 0.9],
                begin: AlignmentGeometry.center,
                end: AlignmentGeometry.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          height: height * 0.95,
          width: width,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(8, (index) {
                return Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: MColors.pur100,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                );
              }),
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
        ),
        Obx(() {
          return controller.search.value == ""
              ? Container()
              : Container(
                  margin: EdgeInsets.only(
                    left: width * 0.03,
                    top: height * 0.08,
                  ),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white.withOpacity(0.9),
                        width: width * 0.94,

                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          itemCount: controller.searchMovies.length.clamp(
                            0,
                            10,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.blue,
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.toNamed(
                                        "movie",
                                        arguments: controller
                                            .searchMovies[index]
                                            .getMovieName(),
                                      );
                                    },
                                    title: Text(
                                      controller.searchMovies[index]
                                          .getMovieName(),
                                      style: TextStyle(
                                        color: Colors.purple[700]?.withOpacity(
                                          0.7,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: width * 0.94,
                        color: Colors.white,
                        child: ListTile(
                          onTap: () {
                            Get.toNamed('/search');
                          },
                          title: Text(
                            ">>  See all",
                            style: TextStyle(color: Colors.purple.shade600),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ],
    );
  }
}
