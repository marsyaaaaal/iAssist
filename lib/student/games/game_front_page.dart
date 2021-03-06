// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iassist/audioplayer_with_local_asset.dart';
import 'package:iassist/fade_transition.dart';
import 'package:iassist/icon.dart';
import 'package:iassist/student/games/level_3/level_3a.dart';
import 'package:iassist/widget/change_theme_button_widget.dart';
import 'package:iassist/student/studentfrontpage.dart';
import 'package:iassist/student/games/level.dart';
import 'package:iassist/student/games/level_1/level_1.dart';
import 'package:sizer/sizer.dart';

import 'package:iassist/responsive/sizeconfig.dart';
import '../../selectionpage.dart';
import 'package:iassist/student/games/level_2/level_2.dart';
import 'package:iassist/student/games/level_2/level_3.dart';
import 'package:iassist/student/games/level_3/level_4.dart';
import 'package:iassist/student/games/level_4/level_4a.dart';
import 'package:iassist/student/games/level_5/level_5.dart';
import 'package:iassist/student/games/level_1/Level1QuestionsAndAnswers.dart'
    as level1;
import 'package:iassist/student/games/level_2/Level2QuestionsAndAnswers.dart'
    as level2;
import 'package:iassist/student/games/level_3/Level3QuestionsAndAnswers.dart'
    as level3;
import 'package:iassist/student/games/level_4/Level4QuestionsAndAnswers.dart'
    as level4;
import 'package:iassist/student/games/level_5/Level5QuestionsAndAnswers.dart'
    as level5;

import 'package:sizer/sizer.dart';

class GameFrontPage extends StatefulWidget {
  @override
  _GameFrontPageState createState() => _GameFrontPageState();

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _GameFrontPageState extends State<GameFrontPage> {
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
        actions: <Widget>[ChangeThemeButtonWidget(), SizedBox(width: 25)],
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
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
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0xFFBA494B),
                ),
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  resetCurrentLevel();
                  resetCurrentLives();
                  //for level 1
                  level1.resetCurrentNumber();
                  level1.resetCurrentPoints();
                  //for level 2
                  level2.resetCurrentNumber();
                  level2.resetCurrentPoints();
                  //for level 3
                  level3.resetCurrentNumber();
                  level3.resetCurrentPoints();
                  //for level 4
                  level4.resetCurrentNumber();
                  level4.resetCurrentPoints();
                  //for level 5
                  level5.resetCurrentNumber();
                  level5.resetCurrentPoints();
                  resetTotalPoints();
                  Navigator.of(context).push(CustomPageRoute(SelectionPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color(0xFFBA494B),
                ),
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Settings',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF4785B4),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Dark Mode\t\t',
                                        style: TextStyle(
                                          color: Color(0xFF4785B4),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    ChangeThemeButtonWidget(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Music \t\t\t\t\t\t\t',
                                        style: TextStyle(
                                          color: Color(0xFF4785B4),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    AudioPlayerWithLocalAsset(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app_outlined,
                  color: Color(0xFFBA494B),
                ),
                title: Text(
                  'Exit',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  });
                  stopMusic();
                },
              ),
            ],
          ),
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
              height: SizeConfig.safeBlockVertical! * 100,
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
                  Positioned(
                    top: SizeConfig.safeBlockVertical! * 11,
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal! * 5),
                          height: SizeConfig.safeBlockVertical! * 100,
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(CustomPageRoute(StudentFrontPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.safeBlockVertical! * 1.5,
                                left: SizeConfig.safeBlockHorizontal! * 7),
                            height: SizeConfig.safeBlockVertical! * 4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.topLeft,
                                fit: BoxFit.contain,
                                image:
                                    AssetImage('assets/images/games/Back.png'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.safeBlockVertical! * 15),
                          height: SizeConfig.safeBlockVertical! * 13.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/images/games/Game.png'),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.0, -1.0),
                          padding: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical! * 29,
                          ),
                          child: Text(
                            'Level ' + (getCurrentLevel()).toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              color: Color(0xFFBA494B),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.0, -1.0),
                          padding: EdgeInsets.only(
                              top: SizeConfig.safeBlockVertical! * 35),
                          child: Text(
                            (getCurrentLevel() == 1)
                                ? 'Introduction to Newton\'s \nLaw of Motion'
                                : (getCurrentLevel() == 2)
                                    ? 'Newton???s First Law of Motion: \nInertia'
                                    : (getCurrentLevel() == 3)
                                        ? 'Second law of Motion: \nLaw of Acceleration'
                                        : (getCurrentLevel() == 4)
                                            ? 'Third law of Motion: \nLaw of Interaction'
                                            : '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              color: Color(0xFFBA494B),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.safeBlockHorizontal! * 50,
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 50.h),
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
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(20),
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
                              //navigate to what level is the current level
                              if (current_level == 1) {
                                Navigator.of(context).push(CustomPageRoute(Level1()));
                              } else if (current_level == 2) {
                                Navigator.of(context).push(CustomPageRoute(Level2()));
                              } else if (current_level == 3) {
                                Navigator.of(context).push(CustomPageRoute(Level3a()));
                              } else if (current_level == 4) {
                                Navigator.of(context).push(CustomPageRoute(Level4a()));
                              } else if (current_level == 5) {
                                Navigator.of(context).push(CustomPageRoute(Level5()));
                              }
                              // else if (current_level == 3) {
                              //   // Navigator.push(
                              //   //   context,
                              //   //   MaterialPageRoute(
                              //   //     builder: (context) => Level3(),
                              //   //   ),
                              //   );
                              // } else if (current_level == 4) {
                              //   // Navigator.push(
                              //   //   context,
                              //   //   MaterialPageRoute(
                              //   //     builder: (context) => Level4(),
                              //   //   ),
                              //   );
                              // } else if (current_level == 5) {
                              //   // Navigator.push(context, MaterialPageRoute(builder: (context) => Level5(),),);
                              // }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: SizeConfig.safeBlockVertical! * 1,
                                bottom: SizeConfig.safeBlockVertical! * 1,
                              ),
                              child: Text(
                                "START",
                                style: TextStyle(
                                  fontSize: 15.sp,
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
