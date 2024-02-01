import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kdf/film/model/UserDetails.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kdf/film/util/navigator.dart';

class ProfileScreen extends StatelessWidget {
  final UserDetails detailsUser;

  ProfileScreen({Key key, @required this.detailsUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn = GoogleSignIn();
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(detailsUser.userName),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: () {
              _gSignIn.signOut();
              print('Signed out');
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(detailsUser.photoUrl),
              radius: 50.0,
            ),
            SizedBox(height: 10.0),
            Text(
              "İsim : " + detailsUser.userName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "Mail : " + detailsUser.userEmail,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "Provider : " + detailsUser.providerDetails,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.0),
            ),
            new Divider(height: _height / 15, color: Colors.white),
            new Padding(
              padding: new EdgeInsets.only(left: _width / 8, right: _width / 8),
              child: new FlatButton(
                onPressed: () {goToFavorites(context);},
                child: new Container(
                    child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(FontAwesomeIcons.film),
                    new SizedBox(
                      width: _width / 30,
                    ),
                    new Text('İzlenecekler')
                  ],
                )),
                color: Colors.blue[50],
              ),
            ),
            new Divider(height: _height / 50, color: Colors.white),
            new Padding(
              padding: new EdgeInsets.only(left: _width / 8, right: _width / 8),
              child: new FlatButton(
                onPressed: () {Navigator.pushNamed(context, '/stamp_collection_formal');},
                child: new Container(
                    child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Icon(FontAwesomeIcons.bookReader),
                    new SizedBox(
                      width: _width / 30,
                    ),
                    new Text('Okunacaklar')
                  ],
                )),
                color: Colors.blue[50],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
