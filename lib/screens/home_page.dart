import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../screens/books_page.dart';
import '../screens/podcast_page.dart';
import '../screens/workshops.dart';



class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  static final List<Color> colorsByPage = [
    Palette.mainBlue,
    Palette.mainRed,
    Palette.mainPurple,
  ];
  Color bgColor = colorsByPage[0];

  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController controller;
  TabController tabController;
  PageController pageController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    tabController = TabController(vsync: this, length: colorsByPage.length);
    pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  changeBg(int index) {
    setState(() {
      bgColor = colorsByPage[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScaffoldKey,
      backgroundColor: bgColor,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { Navigator.of(context).pop(); },),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_align_right),
            onPressed: () => _homeScaffoldKey.currentState.openDrawer(),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: <Widget>[

              // SizedBox(height: 64,),
              //////////////////////////////////////
              ///////// Header Start
              //////////////////////////////////////
              Hero(
                tag: 'logo-owl-hero',
                child: Image.asset(
                  'assets/images/owl.png',
                  width: 50,
                  height: 50,
                  color: Palette.mainWhite,),
              ),

              Hero(
                tag: 'start-button-tab-hero',
                child: SizedBox(height: 20,),
              ),

              Hero(
                tag: 'title-hero',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'Discover. Learn. Elevate.',
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Palette.mainWhite,
                    ),),
                ),
              ),

              SizedBox(height: 32,),
              //////////////////////////////////////
              ///////// Header End
              //////////////////////////////////////
              //////////////////////////////////////
              ///////// Middle Start
              //////////////////////////////////////
              Expanded(
                child: SizedBox.expand(
                  child: Hero(
                    tag: 'start-button-hero',
                    child: Material(
                      color: Palette.mainWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                        child: Column(
                          children: <Widget>[
                            //////////////////////////////////////
                            ///////// Tabs Start
                            //////////////////////////////////////
                            TabBar(
                              controller: tabController,
                              isScrollable: false,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 4.0,
                              indicatorColor: Palette.mainBlue,
                              labelColor: Palette.textBlack,
                              tabs: <Widget>[
                                Tab(child: Text('BOOKS', style: TextStyle()),),
                                Tab(child: Text('PODCAST', style: TextStyle()),),
                                Tab(child: Text('WORKSHOPS', style: TextStyle()),),
                              ],
                            ),
                            //////////////////////////////////////
                            ///////// Tabs End
                            //////////////////////////////////////
                            //////////////////////////////////////
                            ///////// TabView Start
                            //////////////////////////////////////
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                children: <Widget>[
                                  BooksPage(
                                    pageController: pageController,
                                    callback: changeBg,),
                                  PodcastPage(),
                                  WorkshopsPage(),
                                ],
                              ),
                            ),
                            //////////////////////////////////////
                            ///////// TabView End
                            //////////////////////////////////////
                            SizedBox(height: 50,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //////////////////////////////////////
              ///////// Middle End
              //////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}