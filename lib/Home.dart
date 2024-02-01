import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kdf/book/pages/AddCom.dart';
import 'package:kdf/paylas.dart';






class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Anasayfa"),
        actions: <Widget>[
          new IconButton(
            color:Colors.white,
            icon: new Icon (Icons.message),

            iconSize: 35,
               
         onPressed: () {
    print("Butona 1 Kez Tıklandı");
    }
            ),
            new IconButton(
        color: Colors.white,
        iconSize: 35,
        icon:new Icon(Icons.notifications) , 
        
         onPressed: () {
    print("Butona 1 Kez Tıklandı");
    }
        
        )
        ],
      ),//AppBar

      
     
   floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      
        elevation: 50,
        
        backgroundColor: Colors.blue,
         onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Paylas(),
                  ),
                );
            }

      
  
),
    
    );//Scaffold
  }//Widget
}


class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Kitap').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['name']),
                  subtitle: new Text(document['writer']),
                  trailing: new Text(document['publisher']),
                );
              }).toList(),
            );
        }
      },
    );
  }
}