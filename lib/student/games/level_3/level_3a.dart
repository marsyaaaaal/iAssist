// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iassist/icon.dart';
import 'package:iassist/widget/change_theme_button_widget.dart';
import 'package:iassist/student/games/game_front_page.dart';
import 'package:iassist/student/games/level.dart';
import 'package:iassist/student/games/level_2/level_3.dart';
import 'package:iassist/student/games/level_3/level_3a.dart';
import 'package:iassist/student/games/level_3/level_3b.dart';
import 'package:iassist/student/games/level_3/questions.dart';
import 'package:iassist/responsive/sizeconfig.dart';
import 'package:sizer/sizer.dart';
import 'Level3QuestionsAndAnswers.dart';
import '../../../selectionpage.dart';

class Level3a extends StatefulWidget {
  @override
  _Level3State createState() => _Level3State();

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _Level3State extends State<Level3a> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int current_level = getCurrentLevel();
    return Scaffold(
      // backgroundColor: Color(0xFFBA494B),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(
          color: Color(0xFFBA494B),
        ),
        title: Text(
          'GAME MODE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFBA494B),
            fontSize: 12.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: <Widget>[ChangeThemeButtonWidget(), SizedBox(width: 3.5.w)],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xFFBA494B),
                  image: DecorationImage(
                      image: AssetImage("assets/images/SelectionHeader.png"),
                      fit: BoxFit.cover)),
              child: Text(
                'I-Assist',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'MyFlutterApp'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 16.sp, fontFamily: 'MyFlutterApp'),
              ),
              onTap: () {
                resetCurrentLevel();
                resetCurrentLives();
                resetCurrentNumber();
                resetTotalPoints();
                resetCurrentPoints();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectionPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 16.sp, fontFamily: 'MyFlutterApp'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app_outlined),
              title: Text(
                'Exit',
                style: TextStyle(
                    fontSize: 16.sp,
                    // color: Color(0xFFFFFFFF),
                    fontFamily: 'MyFlutterApp'),
              ),
              onTap: () {
                Future.delayed(const Duration(milliseconds: 1000), () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0XFFFFB79D),
                  Color(0xFFBA494B),
                ],
              )),
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical! * 17,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/Group42.png'),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(17),
                        bottomRight: Radius.circular(17),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.9),
                          spreadRadius: 3,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical! * 2,
                        left: SizeConfig.safeBlockHorizontal! * 5),
                    height: SizeConfig.safeBlockVertical! * 9,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topLeft,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/games/game1.png'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment(0.0, -1.0),
                    padding: EdgeInsets.only(top: 2.5.h, left: 15.w),
                    child: Text(
                      'Level 3\nNewton\'s Second Law of Motion: \nLaw of Acceleration',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: SizeConfig.blockSizeVertical! * 10.8,
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal! * 5),
                          height: SizeConfig.blockSizeVertical! * 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.8),
                                // spreadRadius: 4,
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                    
                        Container(
                          margin: EdgeInsets.only(top: 20.h, left: 10.w),
                          height: SizeConfig.safeBlockVertical! * 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                              image: AssetImage(
                                  'assets/images/games/level3/Group 61.png'),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: SizeConfig.safeBlockHorizontal! * 75,
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical! * 70,
                              left: SizeConfig.safeBlockHorizontal! * 12),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                Color(0xFFBA494B),
                                Color(0XFFFFB79D),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              // elevation: MaterialStateProperty.all(3),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              //if pushed proceeed to questions
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Level3b(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  // fontWeight: FontWeight.w700,
                                  color: Colors.white,
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
            ),
          ],
        ),
      ),
    );
  }
}
