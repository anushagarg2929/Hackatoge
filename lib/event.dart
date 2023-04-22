import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hacktoge/login.dart';
import 'package:hacktoge/profile.dart';
import 'auto.dart';
import 'editprofile.dart';
import 'main.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
String evenname="";
class eventpage extends StatefulWidget {
  const eventpage({Key? key}) : super(key: key);
  @override
  State<eventpage> createState() => _eventpageState();
}
class _eventpageState extends State<eventpage> {
  TextEditingController nameoftheevent=TextEditingController();
  TextEditingController dateoftheevent=TextEditingController();
  TextEditingController locationofevent=TextEditingController();
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  profile()),);
                },
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 26.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(url)
                  ),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(20, 20, 0,0),
                  //   child: SizedBox(
                  //     width: 200,
                  //     child: ElevatedButton(
                  //       onPressed: ()
                  //       async {
                  //         b=await getFromGallery();
                  //         uploadList(b);
                  //
                  //       },
                  //       child: Text("Edit profile image"),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: nameoftheevent,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of event',

                      ),
                      onTap: (){evenname=nameoftheevent.text;},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                        controller: dateoftheevent,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'date of the event',
                        ),
                        onTap: (){}
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                        controller: locationofevent,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'location of th event',
                        ),
                        onTap: (){}
                    ),

                  ),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 08, 0,0),
                        child: ElevatedButton(
                            child: (
                                Text("Done")
                            ),
                            onPressed:() async {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => const homescreen()),
                              );


                              if (nameoftheevent.text == "" ||
                                  locationofevent.text == ""||dateoftheevent=="") {
                                print("invalid");
                              }
                              else {
                                String result = await AuthMethods().calenderevent(eventname: nameoftheevent.text, eventaddress: locationofevent.text, eventdate: dateoftheevent.text, );
                                bool _isLoading=true;
                                if (result != 'success') {
                                  print("fail");
                                }
                                setState(() {
                                  _isLoading = false;
                                });
                              }
                            }
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 08, 0,0),
                        child: ElevatedButton(
                            child: (
                                Text("home")
                            ),
                            onPressed:() {
                              fetchname(email1);
                              fetchUsers("coding");
                              fetchevent();
                              setState((){
                                // Navigator.push(
                                //   context, MaterialPageRoute(builder: (context) => const homescreen()),
                                // );
                              });

                            }
                        ),
                      ),
                    ],
                  ),
                ]
            )
        )
    );
  }
}
