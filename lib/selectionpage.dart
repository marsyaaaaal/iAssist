import 'package:flutter/material.dart';
import 'package:iassist/icon.dart';
import 'package:iassist/student/studentfrontpage.dart';
import 'package:iassist/teacher/teacherfrontpage.dart';
import 'package:iassist/teacher/teacherloginpage.dart';

class SelectionPage extends StatefulWidget{
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height,
              child: Stack(
                children:<Widget>[
                  Container(
                    height: size.height * 0.29,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/SelectionHeader.png'),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.8),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, left:22),
                    child: Text('Welcome to I-Assist', 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 68, left:25),
                    child: Text('Offline educational application designed\nfor Eight Graders to learn more about\nthe concept of Newton’s Law of Motion',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.274,
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 45),
                          height: size.height * 0.48,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500.withOpacity(.5),
                                spreadRadius: 4,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * .15,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/images/LetsGetStarted.png'),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.0,-1.0),
                          padding: const EdgeInsets.only(top: 132),
                          child: Text('Let’s get started', 
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xFFBA494B),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0.0, -1.0),
                          padding: const EdgeInsets.only(top: 158),
                          child: Text('Please choose a mode', 
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFFFFB79D),
                            ),
                          ),
                        ),
                        Container(
                          // alignment: Alignment(0.0, 1.0),
                          width: size.width * 0.6,
                          margin: const EdgeInsets.only(top: 195, left: 83),
                          child:OutlinedButton.icon(onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentFrontPage(),),);
                          },
                            icon: const Icon(MyFlutterApp.studentbtn, color: Color(0xFFBA494B),), 
                            label: Text("STUDENT",  
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBA494B),
                                fontSize: 18,
                              )),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                  width: 2.3,
                                  color: Color(0xFFBA494B),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 20, bottom: 20),
                                ),
                          ),
                        ),
                        Container(
                          width: size.width * .6,
                          margin: EdgeInsets.only(top: 280, left: 83), 
                          child:OutlinedButton.icon(onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLoginPage(),),);
                          },
                            icon: Icon(MyFlutterApp.teacherbtn, color: Color(0xFFBA494B),), 
                            label: Text(" TEACHER",  
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFBA494B),
                                fontSize: 18,
                              )),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                  width: 2.3,
                                  color: Color(0xFFBA494B),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    
                                  ),padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 20, bottom: 20),
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left:35.0, right: 35.0, bottom: 45.0),
        child: Container(
          child: TabBar(
            labelColor: Color(0xFF4785B4),
            unselectedLabelColor: Color(0xFFBA494B),
            labelStyle:TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold) ,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Color(0xFF4785B4), width: 0.0)
            ),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.info_outline),
                text: 'About',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Settings',
              ),
              Tab(
                icon: Icon(Icons.exit_to_app_outlined),
                text: 'Exit',
              ),
            ],
            controller:  _tabController,
          ),
              decoration: BoxDecoration(  
                color: Theme.of(context).primaryColor,
            // border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),        
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500.withOpacity(.7),
                      spreadRadius: 2,
                      blurRadius: 5,
                      
                    ),
                  ],
                ),         
        ),
      ),
    );
  }
}