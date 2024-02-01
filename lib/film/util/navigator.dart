import 'package:flutter/material.dart';
import 'package:kdf/book/pages/AddCom.dart';
import 'package:kdf/film/Films.dart';
import 'package:kdf/film/model/cast.dart';
import 'package:kdf/film/model/mediaitem.dart';
import 'package:kdf/film/model/tvseason.dart';
import 'package:kdf/film/util/mediaproviders.dart';
import 'package:kdf/film/widgets/actor_detail/actor_detail.dart';
import 'package:kdf/film/widgets/favorites/favorite_screen.dart';
import 'package:kdf/film/widgets/media_detail/media_detail.dart';
import 'package:kdf/film/widgets/search/search_page.dart';
import 'package:kdf/film/widgets/season_detail/season_detail_screen.dart';
import 'package:kdf/paylas.dart';

goToMovieDetails(BuildContext context, MediaItem movie) {
  MediaProvider provider =
      (movie.type == MediaType.movie) ? MovieProvider() : ShowProvider();
  _pushWidgetWithFade(context, MediaDetailScreen(movie, provider));
}

goToSeasonDetails(BuildContext context, MediaItem show, TvSeason season) =>
    _pushWidgetWithFade(context, SeasonDetailScreen(show, season));

goToActorDetails(BuildContext context, Actor actor) {
  _pushWidgetWithFade(context, ActorDetailScreen(actor));
}

goToSearch(BuildContext context) {
  _pushWidgetWithFade(context, SearchScreen());
}
goToYorum(BuildContext context, MediaItem movie)
{

   _pushWidgetWithFade(context, Paylas());
}

goToFavorites(BuildContext context) {
  _pushWidgetWithFade(context, FavoriteScreen());
}

_pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
        PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return widget;
            }),
      );
}
