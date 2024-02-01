import 'package:flutter/material.dart'; 
import 'package:kdf/Home.dart';
import 'package:kdf/film/Films.dart';
import 'package:kdf/login/Login.dart';
import 'package:kdf/book/Books.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class MyApp extends StatefulWidget{
 @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    Swap(),
    Books(),
    Login()
  ];
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kdf/film',
      theme: ThemeData(  
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
                        _selectedPage = index;
                         });
          },
          items: [ 
            BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.home),
              title: Text('Anasayfa'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.film),
              title: Text('Film'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
              BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.bookOpen),
              title: Text('Kitap'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.user),
              title: Text('Giriş'),
              backgroundColor: Theme.of(context).primaryColor,
            ), 
          ],
        ),
      ),
    );
  }
}