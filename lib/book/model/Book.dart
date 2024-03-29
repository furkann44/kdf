import 'package:meta/meta.dart';

class Book {
  static final db_title = "title";
  static final db_url = "url";
  static final db_id = "id";
  static final db_notes = "notes";
  static final db_star = "star";
  static final db_author = "author";
  static final db_description = "description";
  static final db_subtitle = "subtitle";
  static final db_pageCount = "pageCount";
  static final db_buyLink = "buyLink";
  static final db_webReaderLink = "webReaderLink";
  static final db_isbn = "ISBN_13";

  String title, url, id, notes, description, subtitle, buyLink, webReaderLink, isbn;
  int pageCount;
  
  //First author
  String author;
  bool starred;
  Book({
    @required this.title,
    @required this.url,
    @required this.id,
    @required this.author,
    @required this.description,
    @required this.subtitle,
    @required this.pageCount,
    this.buyLink,
    this.webReaderLink,
    this.isbn,
    this.starred = false,
    this.notes = "",
  });

  Book.fromMap(Map<String, dynamic> map): this(
    title: map[db_title],
    url: map[db_url],
    id: map[db_id],
    starred: map[db_star] == 1,
    notes: map[db_notes],
    description: map[db_description],
    author: map[db_author],
    subtitle: map[db_subtitle],
    pageCount: map[db_pageCount],
    buyLink: map[db_buyLink],
    webReaderLink: map[db_webReaderLink],
    isbn: map[db_isbn],
  );

  // Currently not used
  Map<String, dynamic> toMap() {
    return {
      db_title: title,
      db_url: url,
      db_id: id,
      db_notes: notes,
      db_star: starred? 1:0,
      db_description: description,
      db_author: author,
      db_subtitle: subtitle,
      db_pageCount: pageCount,
      db_buyLink: buyLink,
      db_webReaderLink: webReaderLink,
      db_isbn: isbn,
    };
  }
}
