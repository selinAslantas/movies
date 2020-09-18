import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {
  final dynamic popularity;
  final String backdropPath;
  final String title;
  final Function onTapped;

  MovieWidget(
      {Key key,
      this.popularity,
      this.backdropPath,
      this.title,
      @required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    /*return
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Hero(
                        tag: Image,
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                                "https://image.tmdb.org/t/p/w500/qVygtf2vU15L2yKS4Ke44U4oMdD.jpg"),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  child: Text("${widget.popularity}"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "${widget.title}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );*/
    return Card(
      color: Colors.black54,
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(width: 5, color: Colors.black45)),
      child: InkWell(
        onTap: onTapped,
        child: Container(
          margin: const EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(10.0),
          color: Colors.black12,
          child: Container(
            color: Colors.black,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: "$backdropPath",
                  child: Image.network(
                      "https://image.tmdb.org/t/p/w500$backdropPath"),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    child: Padding(
                        padding: EdgeInsets.all(5), child: Text("$popularity")),
                    radius: 15,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("$title",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            backgroundColor: Colors.black45)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
