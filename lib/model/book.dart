import 'package:flutter/widgets.dart';

class Book {
  final String url;
  final String bookUrl;
  final String title;
  final String text;
  final String author;
  final Color color;

  const Book({
    this.url,
    this.bookUrl,
    this.title,
    this.text,
    this.author,
    this.color
  });
}