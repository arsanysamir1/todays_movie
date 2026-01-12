import 'package:flutter/material.dart';

import '../../../../../util/constants/colors.dart';
import 'package:get/get.dart';
import '../../../controllers/search_controller.dart';
import '../../../modules/movies.dart';

class MoviesScroller extends StatelessWidget {
  const MoviesScroller({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Searchcontroller());
    final width = MediaQuery.of(context).size.width;


    return Container(
      width: width,
      height: 240,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(margin: EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              color: MColors.pur800,
              elevation: 10,
              child:
                  InkWell(
                    onTap: (){
                        Get.toNamed("/movie",arguments: Movies.movies[index].getMovieName());
                    },
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 230,
                        width: 200,
                        child: Image(
                          image: NetworkImage(Movies.movies[index].getMainImage()),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),


            ),
          );
        },
      ),
    );
  }
}
