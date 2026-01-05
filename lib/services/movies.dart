
import 'package:http/http.dart' as http;


class IMDBService{
  static Future<void> fetchTopMovies() async {
    final top250_movies = Uri.parse('https://imdb236.p.rapidapi.com/api/imdb/top250-movies');
    final most_popular_movies = Uri.parse('https://imdb236.p.rapidapi.com/api/imdb/most-popular-movies');
    final top_rated_english_movies = Uri.parse('https://imdb236.p.rapidapi.com/api/imdb/top-rated-english-movies');
    final lowest_rated_movies = Uri.parse('https://imdb236.p.rapidapi.com/api/imdb/lowest-rated-movies');
    final headers = {
      'x-rapidapi-host': 'imdb236.p.rapidapi.com',
      'x-rapidapi-key': '439b816d65msh9c0803530b6f15dp161980jsn751c77e25687',
    };


    try {
      final res_top250_movies = await http.get(top250_movies, headers: headers);
      final res_most_popular_movies = await http.get(most_popular_movies, headers: headers);
      final res_top_rated_english_movies = await http.get(top250_movies, headers: headers);
      final res_lowest_rated_movies = await http.get(top250_movies, headers: headers);

      if (res_top250_movies.statusCode == 200) {
        // Success: Process the data here


        final max=res_top_rated_english_movies.body.codeUnits;

        print(max[10]);


      } else {
        // Error: Handle non-200 status codes
        print('Request failed with status: ${res_top250_movies.statusCode}');
      }
    } catch (e) {
      // Exception: Handle network errors (e.g., no internet connection)
      print('An error occurred: $e');
    }

  }
}