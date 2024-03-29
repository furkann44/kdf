import 'package:flutter/material.dart';
import 'package:kdf/film/model/mediaitem.dart';
import 'package:kdf/film/util/navigator.dart';

class SimilarSection extends StatelessWidget {
  final List<MediaItem> _similarMovies;

  SimilarSection(this._similarMovies);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Benzer",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          height: 300.0,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            scrollDirection: Axis.horizontal,
            children: _similarMovies
                .map((MediaItem movie) => GestureDetector(
                      onTap: () => goToMovieDetails(context, movie),
                      child: FadeInImage.assetNetwork(
                        image: movie.getPosterUrl(),
                        placeholder: 'assets/placeholder.jpg',
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
