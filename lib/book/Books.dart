import 'package:flutter/material.dart'; 
import 'package:kdf/book/pages/universal/collection_page.dart';
import 'package:kdf/book/pages/formal/stamp_collection_page_formal.dart';
import 'package:kdf/book/pages/home_page.dart';
import 'package:kdf/book/pages/material/search_book_page_material.dart';
import 'package:kdf/book/pages/formal/search_book_page_formal.dart';
import 'package:kdf/book/pages/material/stamp_collection_page_material.dart'; 
import 'package:redux/redux.dart';
import 'package:kdf/book/redux/app_state.dart';
import 'package:kdf/book/redux/reducers.dart';
 
class Books extends StatelessWidget {
  final Store<AppState> store = new Store(readBookReducer, initialState: AppState.initState());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap',  
        theme: new ThemeData(
          primaryColor: new Color(0xFF0F2533),
        ),
        routes: {
          '/': (BuildContext context) => new HomePage(),
          '/search_material': (BuildContext context) => new SearchBookPage(),
          '/search_formal': (BuildContext context) => new SearchBookPageNew(),
          '/collection': (BuildContext context) => new CollectionPage(),
          '/stamp_collection_material': (BuildContext context) => new StampCollectionPage(),
          '/stamp_collection_formal': (BuildContext context) => new StampCollectionFormalPage(),
        },
    );
  }
}

 
 
 