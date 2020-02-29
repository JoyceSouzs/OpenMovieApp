
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_flutter_app/models/movie_response.dart';
import 'package:movie_flutter_app/services/movie_service.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetails extends StatefulWidget {
   final MovieResponse model;
  MovieService service = MovieServiceImpl();

  MovieDetails([this.model, this.service]);
  
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
   MovieResponse movieResponseModel;

  @override
  void initState() {
    super.initState();
     _feedDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
        backgroundColor: Colors.black,
      ),
      body: Container(
            //color: Colors.grey,
            child: movieResponseModel != null
                ? Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          elevation: 50,
                          //color: Colors.grey,
                          child: Container(
                            margin: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${movieResponseModel.title}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 16),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 0,
                                    thickness: 0.5,
                                  ),
                                ),
                                Text(
                                    "Year: ${movieResponseModel.year}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Runtime: ${movieResponseModel.runtime}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Actors: ${movieResponseModel.actors}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Director: ${movieResponseModel.director}",
                                    style: TextStyle(color: Colors.black)),
                                Text(
                                    "Plot: ${movieResponseModel.plot}",
                                    style: TextStyle(color: Colors.black)),  
                              ],
                            ),
                          ),
                        ),
                         Center(
                           child: Column(
                            children: <Widget>[
                            FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: movieResponseModel.poster,
                            width: 300,
                            height: 300,
                  ),
            ],
          ),
                         ),
        ], 
      )) 
                  : Container(),));
  }

   _feedDataSource() {
    widget.service
    .fetchMovieWithTitle(title: widget.model.title)
    .then((response){
      var json = jsonDecode(response.body);
      var model = MovieResponse.fromMappedJson(json);
        setState(() {
          movieResponseModel = model;
        });
    });
  }
}
