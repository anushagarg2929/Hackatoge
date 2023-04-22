import 'package:firebase_auth/firebase_auth.dart';
import 'package:hacktoge/editprofile.dart';

import 'create.dart';
import 'login.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 25, 5, 5),
                  child: Container(
                    height: 360,
                    width: 360,
                    child: Image.network(url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(27, 12, 0, 0),
                    child: Text("${username}",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      )
                      ,),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(27, 10, 0, 0),
                child: Text("Coder",
                  style: TextStyle(
                    fontSize: 18,
                  )
                  ,),
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("20",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Following",
                          style: TextStyle(
                            fontSize: 18,
                          )
                          ,),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("345",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Friends",
                          style: TextStyle(
                            fontSize: 18,
                          )
                          ,),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text("12",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Groups",
                          style: TextStyle(
                              fontSize: 18
                          ),),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Row(

              children: [
                SizedBox(
                  width: 5,
                ),
                Text("BIO",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Flexible(child: Text("$userbio",
                  style: TextStyle(
                      fontSize: 16
                  )
                  ,))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text("Interest",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),)
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 10,
                width: 20,
              ),
              SizedBox(
                  height: 100,
                  width: 350,
                  child: SizedBox(
                    height:500,
                    child: GridView.builder
                      (    shrinkWrap: true,
                        physics: ClampingScrollPhysics(),

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 3
                        ),

                        itemCount: userinterest.length,
                        itemBuilder: (context, Index) {
                          return
                            Container(
                              height: 1,
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(width: 1, color: Colors.black),
                              ),
                              child: Center(child: Text('${userinterest[Index]}')),
                            );
                        }

                    ),
                  )
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text("Hobbies",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),)
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                  height: 100,
                  width: 350,
                  child: SizedBox(
                    height:3000,
                    child: GridView.builder
                      (


                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 2
                        ),

                        itemCount: userhobby.length,
                        itemBuilder: (context, Index) {
                          return
                            Container(
                              height: 1,
                              width: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(width: 1, color: Colors.black),
                              ),
                              child: Center(child: Text('${userhobby[Index]}')),
                            );
                        }
                    ),
                  )
              ),

            ],
          ),
          Text("Articles",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(10)),

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(post,
                style: TextStyle(fontSize: 16),),
            ),
          )
        ],


      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Account Setting section
          Container(
            height: 200,
            child: Row(
              children: <Widget>[
                // ImageView

                // TextView
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Account Setting',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Your account settings here',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(16),
                      child: IconButton(icon: Icon(Icons.home), onPressed: () { Navigator.pop(context);
                      },
                      )
                  ),
                ),
              ],
            ),
          ),
          // Sign Out section
          Row(
            children: <Widget>[
              // ImageButton
              Container(
                  margin: EdgeInsets.all(16),
                  child: TextButton.icon(onPressed: (){ Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const itemadder1()),
                  );}, icon: Icon(Icons.edit), label: Text("Edit Profile",
                    style: TextStyle(
                        fontSize: 24
                    ),))
              ),
            ],
          ),
          // Add another Account section
          Row(
            children: <Widget>[
              // ImageButton
              Container(
                  margin: EdgeInsets.all(16),
                  child: TextButton.icon(onPressed: (){Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const loginpage()),
                  );}, icon: Icon(Icons.add), label: Text("Add another Account",
                    style: TextStyle(
                        fontSize: 24
                    ),))
              ),
            ],
          ),
          // Edit profile Picture section
          Row(
            children: <Widget>[
              // ImageButton
              Container(
                  margin: EdgeInsets.all(16),
                  child: TextButton.icon(onPressed: (){
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const loginpage()));
                  }, icon: Icon(Icons.close), label: Text("Sign out",
                    style: TextStyle(
                        fontSize: 24
                    ),))
              ),
            ],
          ),
        ],
      ),
    );
  }
}