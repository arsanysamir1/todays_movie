import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'dart:convert';
import '../../features/modules/movie.dart';
import '../../features/modules/movies.dart';

class JasonService {

  static void getJasonFiles() async {

    String top250 = await rootBundle.loadString('jason/250.txt');
    // String populer = await rootBundle.loadString('jason/popular.txt');
    // String top_related = await rootBundle.loadString('jason/popular.txt');

    List<dynamic> decodedList = jsonDecode(top250);
    List<Map<String, dynamic>> myMovies = List<Map<String, dynamic>>.from(
      decodedList,
    );

    for (Map<String, dynamic> a in myMovies) {
      int totalMinutes = a["runtimeMinutes"];

      int hours = totalMinutes ~/ 60;   // Integer division (gives the number of whole hours)
      int minutes = totalMinutes % 60;
      Movie movie = Movie(
        a["id"],
        a["primaryTitle"],
        a["description"],
        a["primaryImage"],
        a["thumbnails"],
        a['genres'],
        a["averageRating"].toString(),
          NumberFormat.compact().format(a["numVotes"]).toString(),
      "$hours h : $minutes m",
        a["releaseDate"]!=null?a["releaseDate"]:"",
        ["top250"],
      );



      Movies.movies.add(movie);

    }
  }
}
