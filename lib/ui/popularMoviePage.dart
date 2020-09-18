import 'package:flutter/material.dart';
import 'package:movies_app/config/app_config.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/service/movieService.dart';
import 'package:movies_app/ui/detailPage.dart';
import 'package:movies_app/widgets/movieWidget.dart';

class PopularMoviePage extends StatefulWidget {
  @override
  _PopularMoviePageState createState() => _PopularMoviePageState();
}

class _PopularMoviePageState extends State<PopularMoviePage> {
MovieService movieService = MovieService();


  void cardTapped({Movie movie}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(movie: movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              centerTitle: true,
        title: Text("Popular Movies", style: TextStyle(color:Colors.white, fontSize: 21),),
      ),
          body: FutureBuilder(
          future: movieService.getPopularMovies(
              apiKey: AppConfig.apiKey,
              language: "en-US",
              page: "1"),
          builder: (BuildContext context,
              AsyncSnapshot<List<Movie>> snapshot) {

            if (snapshot.hasData) {
              //snapshot.data.forEach((f)=> print(f.backdropPath));
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return MovieWidget(
                      title: snapshot.data[index].title,
                      backdropPath: snapshot.data[index].backdropPath,
                      popularity: snapshot.data[index].popularity,
                      onTapped: () => cardTapped(movie: snapshot.data[index]),
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
