

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';  
import 'package:kdf/film/scoped_models/app_model.dart';
import 'package:kdf/film/widgets/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'book/pages/material/search_book_page_material.dart';
import 'film/widgets/search/arafilm.dart';

class Paylas extends StatelessWidget
{
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
 home: Scaffold(
  
        appBar: AppBar(
          title: Text('Burası paylaşım sayfası'),
        ),
        body: new Center(
          child : new Container(
            child: new Column(
          children: <Widget>
          [
  
        new  TextField(
          maxLines: 12,
          maxLength: 39000,
          autocorrect: true,
decoration: new InputDecoration(
  hintText : "Yorumunuzu ekleyin"
  ),
textCapitalization: TextCapitalization.words,
style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
),
 
  new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 
                  new IconButton(icon: Icon(Icons.add_a_photo), 
                  
                  onPressed:()
                    {
                      print("object");
                    },
                  
                  ),
                   new IconButton(icon: Icon(Icons.book), 
                  
                  onPressed:()
                    {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SearchBookPage(),
                  ),
                );
              }
                  
                  ),
                   new IconButton(icon: Icon(Icons.movie), 
                  
                  onPressed:()
                    {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SearchScreenf(),
                  ),
                );
              }
                  
                  ),
                 


                    
                  
                
                   new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed:()
                    {
                      print("object");
                    },
                    child: new Text("Paylaş"),
                  ),
                ],
              )    

          ]
        ),
          ),
        ),
      ),
    );
  }
}