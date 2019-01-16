import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'dart:async' show Future;
import '../screens/home_page.dart';

class StartPage extends StatefulWidget {
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin{
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // type: MaterialType.canvas,
      // color: Palette.mainBlue,
      backgroundColor: Palette.mainBlue,
      body: Stack(
        children: <Widget>[
          Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Hero(
                  tag: 'logo-owl-hero',
                  child: Image.asset(
                    'assets/images/owl.png',
                    width: 100,
                    height: 100,
                    color: Palette.mainWhite,),
                ),

                SizedBox(height: 28,),

                Hero(
                  tag: 'title-hero',
                  child: Material(
                    color: Colors.transparent,
                    child:  Text(
                      'Discover. Learn. Elevate.',
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Palette.mainWhite,
                      ),),
                  )
                ),

                SizedBox(height: 40,),

                FadeTransition(
                  opacity: animateOpacity(
                    1.0, 0.2,
                    controller,
                    interval: Interval(0.0, 1, curve: Curves.easeIn)),
                  child: Hero(
                    // tag: 'start-button-hero',
                    tag: 'start-button-tab-hero',
                    child: Material(
                      color: Palette.mainWhite,
                      borderRadius: BorderRadius.circular(40.0),
                      child: InkWell(
                        onTap: () {
                          controller.forward();
                          Future.delayed(Duration(milliseconds: 100)).then((_) =>
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => HomePage())
                            ));

                        },
                        borderRadius: BorderRadius.circular(40.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                          child: Text(
                            'START EXPLORING',
                            style: TextStyle(
                              fontSize: 13,
                              color: Palette.mainBlueDark2,
                            ),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}