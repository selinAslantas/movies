
import 'package:flutter/material.dart';
import 'package:movies_app/config/app_config.dart';
import 'package:movies_app/service/movieService.dart';
import 'package:movies_app/widgets/movieWidget.dart';
import 'upcomingMovieDetailPage.dart';
import 'package:movies_app/models/movie.dart';

class UpcomingMoviePage extends StatefulWidget {
  @override
  _UpcomingMoviePageState createState() => _UpcomingMoviePageState();
}

class _UpcomingMoviePageState extends State<UpcomingMoviePage> {
  MovieService movieService = MovieService();


  void cardTapped({Movie upcomingMovie}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpcomingMovieDetailPage(upcomingMovie: upcomingMovie),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        title: Text("Upcoming Movies", style: TextStyle(color:Colors.white, fontSize: 21),),
      ),
          body: FutureBuilder(
          future: movieService.getUpcomingMovies(
              apiKey: AppConfig.apiKey,
              language: "en-US",
              page: "1"),
          builder: (BuildContext context,
              AsyncSnapshot<List<Movie>> snapshot) {

            if (snapshot.hasData) {
              snapshot.data.forEach((f)=> print(f.backdropPath));
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return MovieWidget(
                      title: snapshot.data[index].title,
                      backdropPath: snapshot.data[index].backdropPath,
                      popularity: snapshot.data[index].popularity,
                      onTapped: () => cardTapped(upcomingMovie: snapshot.data[index]),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
