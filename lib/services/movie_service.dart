import 'package:http/http.dart' as http;

class BaseService {
  String baseURL = "http://www.omdbapi.com";
  String key = "&apikey=1b857594";

  String formURL(String endpoint) {
    return "$baseURL$endpoint$key";
  }
}

abstract class MovieService {
  Future<http.Response> fetchMovieWithTitle({String title});
  Future<http.Response> fetchListMovieWithTitle({String title});
}

class MovieServiceImpl extends BaseService implements MovieService {
 
  @override
  Future<http.Response> fetchListMovieWithTitle({String title}) {
    return http.get(formURL("/?s=$title"));
  }

  @override
  Future<http.Response> fetchMovieWithTitle({String title}) {
    return http.get(formURL("/?t=$title"));
  }
}
