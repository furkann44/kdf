import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:kdf/book/data/repository.dart';
import 'package:kdf/book/model/Book.dart';


class AppState {


  AppState({
    this.readBooks
  });

  final List<Book> readBooks;



  static AppState initState() {
    return new AppState(readBooks: []);
  }

}