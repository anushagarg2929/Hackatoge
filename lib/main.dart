import 'package:flutter/material.dart';
import 'package:hacktoge/login.dart';
import 'package:hacktoge/profile.dart';
import 'calender.dart';
import 'create.dart';
import 'event.dart';
import 'firebase_options.dart';
import 'group.dart';
import 'news.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      title: 'Flutter Demo',
      home: loginpage(),
    );
  }
}
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int curindex=0;
  final widgetOptions = [
    new news(),
    new group(),

    new MyHomePage2(),
    new profile(),
  ];
  final title = ["news","Group","Post","Account"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("socialbuddy",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),),

        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyHomePage()),);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30,5,10,5),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  CalendarPage()),);
              },
              child: Icon(
                Icons.calendar_month_outlined,
                size: 26.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body:  Center(
        child: widgetOptions.elementAt(curindex),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'news'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined),label: 'group'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline),label: 'Post'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: 'Profile'),
        // BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined),label: 'calender'),
      ],
        currentIndex: curindex,
        unselectedItemColor:Colors.black,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            curindex = index;
          });},
      ),
    );
  }
}
