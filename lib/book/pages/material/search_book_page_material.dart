import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:kdf/book/data/repository.dart';
import 'package:kdf/book/pages/abstract/search_book_page_abstract.dart';
import 'package:kdf/book/pages/universal/book_notes_page.dart';
import 'package:kdf/book/model/Book.dart';
import 'package:kdf/book/utils/utils.dart';
import 'package:kdf/book/widgets/BookCard.dart';
import 'package:kdf/book/widgets/book_card_compact.dart';
import 'package:kdf/book/widgets/book_card_minimalistic.dart';


class SearchBookPage extends StatefulWidget {

  @override
  _SearchBookState createState() => new _SearchBookState();
}

class _SearchBookState extends AbstractSearchBookState<SearchBookPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Bir önce ki sayfa"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: 'Hangi Kitabı arıyorsun?',
              ),
              onChanged: (string) => (subject.add(string)),
            ),
            isLoading? new CircularProgressIndicator(): new Container(),
            new Expanded(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return new BookCard(
                    book: items[index],
                    onCardClick: (){
                      Navigator.of(context).push(
                          new FadeRoute(
                            builder: (BuildContext context) => new BookNotesPage(items[index]),
                            settings: new RouteSettings(name: '/notes', isInitialRoute: false),
                          ));
                    },
                    onStarClick: (){
                      setState(() {
                        items[index].starred = !items[index].starred;
                      });
                      Repository.get().updateBook(items[index]);
                    },
                  );
               //  return new BookCardMinimalistic(_items[index]);
                },
              ),
            ),
        /*  new Expanded(
            child: new GridView.builder(gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.65), itemBuilder: (BuildContext context, int index) {
              return new BookCardMinimalistic(_items[index]);
            }, itemCount: _items.length,),
          )*/
          ],
        ),
      ),
    
    );
  }
}

