import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../model/book.dart';
import '../data/data.dart';
import '../screens/book_content.dart';

typedef ChangeBg = dynamic Function(int);
class BooksPage extends StatelessWidget {
  final PageController pageController;
  final ChangeBg callback;
  BooksPage({Key key, this.pageController, this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: PageView(
        controller: pageController,
        onPageChanged: (index) {
          callback(index);
        },
        children: books.map((book) {
          return BookWidget(book: book,);
        }).toList(),
      ),
    );
  }
}

class BookWidget extends StatelessWidget {
  final Book book;
  BookWidget({this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
          color: Palette.mainWhite,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Palette.textGrey,
              blurRadius: 5.0,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                child: Hero(
                  tag: book.url,
                  child: Image.asset(book.url, fit: BoxFit.cover),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(height: 20,),

                    Hero(
                      tag: book.title,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          book.title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Palette.textBlack)),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Hero(
                      tag: book.author,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                        'by ${book.author}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Palette.textBlack)),
                      ),
                    ),

                    SizedBox(height: 20,),

                    Material(
                      color: book.color ?? Palette.mainBlue,
                      borderRadius: BorderRadius.circular(40.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => BookContent(book: book,)));
                        },
                        borderRadius: BorderRadius.circular(40.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 38, vertical: 10),
                          child: Text(
                            'READ BOOK',
                            style: TextStyle(
                              fontSize: 15,
                              color: Palette.mainWhite,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}