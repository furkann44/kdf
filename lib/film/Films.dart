import 'package:flutter/material.dart';
import 'package:kdf/film/model/mediaitem.dart';
import 'package:kdf/film/util/mediaproviders.dart';
import 'package:kdf/film/util/navigator.dart';
import 'package:kdf/film/widgets/media_list/media_list.dart';
import 'package:kdf/film/widgets/utilviews/toggle_theme_widget.dart';
  
class Swap extends StatefulWidget{
   @override
  State createState() => MovieState();
}

class MovieState extends State<Swap> {
  PageController _pageController;
  int _page = 0;
  MediaType mediaType = MediaType.movie;

  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          ToggleThemeButton(),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () => goToSearch(context),
          )
        ],
        title: Text("Film"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    const Color(0xff2b5876),
                    const Color(0xff4e4376),
                  ])),
                )),
            ListTile(
              title: Text("Ara"),
              trailing: Icon(Icons.search),
              onTap: () => goToSearch(context),
            ),
            ListTile(
              title: Text("Favoriler"),
              trailing: Icon(Icons.favorite),
              onTap: () => goToFavorites(context),
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Filmler"),
              selected: mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              onTap: () {
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Diziler"),
              selected: mediaType == MediaType.show,
              trailing: Icon(Icons.live_tv),
              onTap: () {
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Kat"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: PageView(
        children: _getMediaList(),
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getNavBarItems(),
        onTap: _navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<BottomNavigationBarItem> _getNavBarItems() {
    if (mediaType == MediaType.movie) {
      return [
        BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up), title: Text('Popüler')),
        BottomNavigationBarItem(
            icon: Icon(Icons.update), title: Text('Yakında')),
        BottomNavigationBarItem(
            icon: Icon(Icons.star), title: Text('En Beğenilen')),
      ];
    } else {
      return [
        BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up), title: Text('Popüler')),
        BottomNavigationBarItem(
            icon: Icon(Icons.live_tv), title: Text('Yayında')),
        BottomNavigationBarItem(
            icon: Icon(Icons.star), title: Text('En Beğenilen')),
      ];
    }
  }

  List<Widget> _getMediaList() {
    return (mediaType == MediaType.movie)
        ? <Widget>[
            MediaList(
              movieProvider,
              "popular",
              key: Key("movies-popular"),
            ),
            MediaList(movieProvider, "upcoming", key: Key("movies-upcoming")),
            MediaList(movieProvider, "top_rated", key: Key("movies-top_rated")),
          ]
        : <Widget>[
            MediaList(showProvider, "popular", key: Key("shows-popular")),
            MediaList(showProvider, "on_the_air", key: Key("shows-on_the_air")),
            MediaList(showProvider, "top_rated", key: Key("shows-top_rated")),
          ];
  }

  void _navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}