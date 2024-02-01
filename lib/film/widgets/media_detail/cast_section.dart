import 'package:flutter/material.dart';
import 'package:kdf/film/model/cast.dart';
import 'package:kdf/film/widgets/media_detail/cast_card.dart';

class CastSection extends StatelessWidget {
  final List<Actor> _cast;

  CastSection(this._cast);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Oyuncular",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          height: 8.0,
        ),
        Container(
          height: 140.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _cast
                .map((Actor actor) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CastCard(actor),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
