import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({required this.movies});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  int _currentPage = 0;
  late String _currentKeyword;
  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            },
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(_currentKeyword, style: TextStyle(fontSize: 11)),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {},
                            )
                          : IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                      Text(
                        '?????? ?????? ?????????',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 35.0,
            width: 80.0,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  Text('??????', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: (){},
                ),
                Text(
                  '??????', 
                  style: TextStyle(color: Colors.white, fontSize:11),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
