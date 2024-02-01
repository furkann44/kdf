import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdf/book/Books.dart';
import 'package:kdf/film/widgets/search/arafilm.dart';
import 'package:kdf/film/widgets/search/search_page.dart';
import 'package:kdf/login/Login.dart';

import 'material/search_book_page_material.dart';




var radio1 =0;


class AddCom extends StatelessWidget {
 
 @override
  Widget build(BuildContext context){
    return Scaffold(
    
     body: Container(
       padding: EdgeInsets.fromLTRB(0, 200, 000, 200),
       child: Column(
         children: <Widget>[
         

           RadioListTile(
             groupValue: radio1,
             value: 1,
             activeColor: Colors.blue,
             secondary: Icon(Icons.movie),
             controlAffinity: ListTileControlAffinity.leading,
             title: Text("Film"),
              onChanged: (val)

              {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SearchScreenf(),
                  ),
                );
              }

              
             
             ),
             

           RadioListTile(
             groupValue: radio1,
             value: 1,
             activeColor: Colors.blue,
              secondary: Icon(Icons.book),
              title: Text("Kitap") ,
                 onChanged: (val)

              {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SearchBookPage(),
                  ),
                );
              }
             
             )
         ],
       )
       
       ),
/*floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      
        elevation: 50,
        
        backgroundColor: Colors.blue,
         onPressed: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Login(),
                  ),
                );
            }

      
  
),*/
    );
  }



/*  @override
  Widget build(BuildContext context) {
      
    return Column(
 children: <Widget>[

   Radio(
     value: 0,
      groupValue: radio1, 
      onChanged: null
     ),
      _myRadioButton(
        title: "Film",
         onChanged: null,
        value: 0,
       
      ),
      _myRadioButton(
        title: "Kitap",
        value: 1,
        onChanged: null,
      ),
    ],

    );
    
  }
  
}
Widget _myRadioButton({String title, int value, Function onChanged}) {
  return RadioListTile(
    value: value,
    groupValue: radio1,
    onChanged: onChanged,
    title: Text(title),
  );*/

}