import 'dart:convert';
import 'package:http/http.dart' as http;

import '../movies_response.dart';

class ApiManager {
  static Future<MoviesResponse> getMovies() async {
    Uri uri = Uri.https('api.themoviedb.org', '3/movie/550',
        {'apikey': '9aaa14ac0eef6353ef8dce88f52a6873'});
    var response = await http.get(uri);
    var sourcesResponse = MoviesResponse.fromJson(jsonDecode(response.body));
    // If the server did return a 200 OK response,
    // then parse the JSON.
    if (response.statusCode == 200) {
      return sourcesResponse;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(sourcesResponse.message != null
          ? sourcesResponse.message
          : 'unable to reach server');
    }
  }
}
