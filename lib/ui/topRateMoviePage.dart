import 'package:flutter/material.dart';
import 'package:movies_app/config/app_config.dart';
import 'package:movies_app/service/movieService.dart';
import 'package:movies_app/widgets/movieWidget.dart';
import 'topRateMovieDetailPage.dart';
import 'package:movies_app/models/movie.dart';

class TopRateMoviePage extends StatefulWidget {
  @override
  _TopRateMoviePageState createState() => _TopRateMoviePageState();
}

class _TopRateMoviePageState extends State<TopRateMoviePage> {
  MovieService topRateMovieService = MovieService();


  void cardTapped({Movie topRateMovie}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TopRateMovieDetailPage(topRateMovie: topRateMovie),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Top Rate Movies", style: TextStyle(color:Colors.white, fontSize: 21),),
      ),
          body: FutureBuilder(
          future: topRateMovieService.getTopRateMovies(
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
                      onTapped: () => cardTapped(topRateMovie: snapshot.data[index]),
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
