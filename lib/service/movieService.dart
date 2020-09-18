import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie.dart';

class MovieService {
  Future<List<Movie>> getPopularMovies({
    String apiKey,
    String language,
    String page,
  }) async {
    //https://api.themoviedb.org/3/movie/popular?api_key=7896722387e54b703820ce535aa3c1a3&language=en-US&page=1

    final http.Response response = await http.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=$language&page=$page");

    final List<Movie> movieList = json
        .decode(response.body)["results"]
        .map<Movie>((f) => Movie.fromJson(f))
        .toList();

    movieList.forEach((f) => print(f.title));
    return movieList;
  }

  Future<List<Movie>> getTopRateMovies({
    String apiKey,
    String language,
    String page,
  }) async {

    final http.Response response = await http.get(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=$language&page=$page");

    final List<Movie> topRateMovieList = json
        .decode(response.body)["results"]
        .map<Movie>((f) => Movie.fromJson(f))
        .toList();

    topRateMovieList.forEach((f) => print(f.title));
    return topRateMovieList;
  }

    Future<List<Movie>> getUpcomingMovies({
    String apiKey,
    String language,
    String page,
  }) async {

    final http.Response response = await http.get(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=$language&page=$page");

    final List<Movie> upcomingMovieList = json
        .decode(response.body)["results"]
        .map<Movie>((f) => Movie.fromJson(f))
        .toList();

   upcomingMovieList.forEach((f) => print(f.title));
    return upcomingMovieList;
  }

    Future<List<Movie>> getNowPlayingMovies({
    String apiKey,
    String language,
    String page,
  }) async {

    final http.Response response = await http.get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=$language&page=$page");

    final List<Movie> nowPlayingMovieList = json
        .decode(response.body)["results"]
        .map<Movie>((f) => Movie.fromJson(f))
        .toList();

   nowPlayingMovieList.forEach((f) => print(f.title));
    return nowPlayingMovieList;
  }


}