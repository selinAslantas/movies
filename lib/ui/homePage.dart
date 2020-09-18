import 'package:flutter/material.dart';
import '../ui/popularMoviePage.dart';
import '../ui/upcomingMoviePage.dart';
import 'topRateMoviePage.dart';
import 'NowPlayingMoviePage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MOVIES"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text(
                  "Popular Movies",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.green[100],
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PopularMoviePage()));
                }),
            RaisedButton(
              
                child: Text(
                  "Top Rate Movies",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                      
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.green[100],
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TopRateMoviePage()));
                }),
            RaisedButton(
                child: Text(
                  "Upcoming Movies",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.green[100],
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpcomingMoviePage()));
                }),
                            RaisedButton(
                child: Text(
                  "Now Playing Movies",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.green[100],
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NowPlayingMoviePage()));
                }),
          ],
        ),
      ),
    );
  }
}
