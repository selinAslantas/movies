import 'package:flutter/material.dart';

class CastWidget extends StatelessWidget {
  final String character;
  final int gender;
  final String name;
  final String profilePath;
  final double size;
  final Function onTapped;

  const CastWidget(
      {Key key, this.character, this.gender, this.name,this.size, this.profilePath,this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$profilePath");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: onTapped,
            child: Container(
              height: size/7,
              width: size/7,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                          "https://image.tmdb.org/t/p/w500$profilePath",
                        ),
              ),
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Text("$name"),
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Text("$character", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      ),
    );
  }
}
