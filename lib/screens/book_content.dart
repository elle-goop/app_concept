import 'package:flutter/material.dart';
import '../model/book.dart';
import '../theme/theme.dart';
import '../widgets/bottom_fade.dart';
// import 'package:epub/epub.dart';


class BookContent extends StatefulWidget {
  final Book book;
  BookContent({this.book});
  _BookContentState createState() => _BookContentState(book: book);
}

class _BookContentState extends State<BookContent> with SingleTickerProviderStateMixin{
  final Book book;
  _BookContentState({this.book});
  AnimationController animationController;
  ScrollController scrollController;
  Animation<Color> colorTween1;
  Animation<Color> colorTween2;
  // Animation<Size> sizeTween;
  Animation<double> sizeTween;
  Size viewportSize;

  final double imageSize = 280.0;
  final double appBarHeight = 90.0;
  final double statusBarSize = 24.0;

  double readPercentage = 0.0;



  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300))
    ..addListener(() => setState(() {}));
    scrollController = ScrollController()
    ..addListener(() {setState((){
        readPercentage = scrollController.offset/scrollController.position.maxScrollExtent;
      });
      animationController.forward();
    });

    colorTween1 = ColorTween(
      begin: Palette.mainBlueT,
      end: book.color,
    ).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: animationController));

    colorTween2 = ColorTween(
      begin: Colors.transparent,
      end: Palette.mainPurple,
    ).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: animationController));

    // sizeTween = SizeTween(
    //   begin: Size(0, appBarHeight),
    //   end: Size.fromWidth(viewportSize.width * readPercentage)
    // ).animate(
    //   CurvedAnimation(
    //     parent: animationController,
    //     curve: Curves.easeIn));
    // sizeTween = Tween(
    //   begin: 0,
    //   end: readPercentage,
    // ).animate(
    //   CurvedAnimation(
    //     parent: animationController,
    //     curve: Curves.easeIn));
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  // Map<String, dynamic> readABook(Book book) async{
  //   var targetFile = File(book.bookUrl);
  //   List<int> bytes = await targetFile.readAsBytes();
  // // Opens a book and reads all of its content into memory
  //   EpubBook epubBook = await EpubReader.readBook(bytes);


  // }

  // List readChapters(EpubBook epub, int chapters) {

  //   epub.Chapters.take(chapters).forEach((EpubChapter chapter) {
  //   // Title of chapter
  //     return {
  //       'chapterTitle': chapter.Title,
  //       'chapterHtmlContent': chapter.HtmlContent,
  //     };
  //   }).toList();
  // }



  @override
  Widget build(BuildContext context) {
    viewportSize = MediaQuery.of(context).size;
    return Material(
      color: Palette.mainWhite,
      // child: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            //////////////////////////////////////
            ///////// Book Content - Image&Text
            //////////////////////////////////////
            ListView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              children: <Widget>[

                SizedBox.fromSize(
                  size: Size.fromHeight(imageSize),
                  child: Hero(
                    tag: book.url,
                    child: Image.asset(book.url, fit: BoxFit.cover),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20,),

                      Hero(
                        tag: book.title,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            book.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                              color: Palette.textBlack,)),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Hero(
                        tag: book.author,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                          'by ${book.author}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Palette.textBlack)),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Container(
                        child: Text(
                          book.text,
                          style: TextStyle(
                            fontSize: 18.0,
                            height: 1.3),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //////////////////////////////////////
            ///////// Book Content End - Image&Text
            //////////////////////////////////////
            //////////////////////////////////////
            ///////// Appbar Start
            //////////////////////////////////////
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox.fromSize(
                size: Size.fromHeight(appBarHeight),
                child: Stack(
                  children: <Widget>[

                    SizedBox.expand(
                      child: Material(
                        color: colorTween1.value,
                      ),
                    ),

                    // TODO: animate
                    // SizedBox.fromSize(
                    //   // size: Size.fromWidth(viewportSize.width * readPercentage),
                    //   size: Size.fromWidth(viewportSize.width * sizeTween.value),
                    //   child: Material(color: colorTween2.value,),
                    // ),

                    // SizeTransition(
                    //   sizeFactor: sizeTween,
                    //   child: Material(color: colorTween2.value,),
                    // ),

                    Center(
                      child: SizedBox.expand(
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            margin: EdgeInsets.only(top: statusBarSize),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.arrow_back, color: Palette.mainWhite,),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),

                                Hero(
                                  tag: 'logo-owl-hero',
                                  child: Image.asset(
                                    'assets/images/owl.png',
                                    width: 40,
                                    height: 40,
                                    color: Palette.mainWhite,),
                                ),

                                IconButton(
                                  icon: Icon(Icons.menu, color: Palette.mainWhite),
                                  onPressed: () {},
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
            //////////////////////////////////////
            ///////// Appbar End
            //////////////////////////////////////


            BottomFade(height: 100,),
          ],
        ),
      // ),
    );
  }
}