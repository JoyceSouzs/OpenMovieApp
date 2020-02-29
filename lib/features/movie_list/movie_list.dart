import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_flutter_app/models/movie_response.dart';
import 'package:movie_flutter_app/services/movie_service.dart';
import 'movie_list_cell.dart';


class MyHomePage extends StatefulWidget {
  MovieService service = MovieServiceImpl();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<MovieResponse> dataSource = [];

 TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(top: 120, bottom: 8),
              child: Container(
                  child: dataSource.isNotEmpty
                      ? ListView(
                          children: dataSource.map((movie) {
                            return Container(
                            child: MovieListPageCell(model : movie));
                          }).toList(),
                        )
                      : Container(),
                ),
          ),
           Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
                child: TextField(controller: _titleController,
                decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  )
                )
              )
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 64, bottom: 8, right: 8, left: 150),
            child: RaisedButton(
            onPressed: () {
                _feedDataSource();
            },
            color: Colors.black,
            textColor: Colors.white,
            child: const Text(
                'Search',
                 style: TextStyle(fontSize: 20)
              ),
            ),
          ),
        ],
      )
    );
  }

  _feedDataSource() {
    widget.service
    .fetchListMovieWithTitle(title: _titleController.text)
    .then((response){
      var json = jsonDecode(response.body);
      List<MovieResponse> movieList = [];
      var list = json["Search"];
      if (list != null) {
        for (var movieJson in list) {
          var movieResponse = MovieResponse.fromMappedJson(movieJson);
          movieList.add(movieResponse);
        }
        setState(() {
          dataSource = movieList;
        });
      }
    });
  }
}
