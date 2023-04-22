import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hacktoge/login.dart';
import 'package:hacktoge/profile.dart';
import 'main.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
File b=File("");
String url="";
String p="";
List hobbies=[];
List interests=[];
String username="";
List userhobby=[];
List userinterest=[];
String userbio="";
String ename="";
String eloc="";
String edate="";
class itemadder1 extends StatefulWidget {
  const itemadder1({Key? key}) : super(key: key);

  @override
  State<itemadder1> createState() => _itemadderState1();
}

class _itemadderState1 extends State<itemadder1> {
  TextEditingController bio=TextEditingController();
  TextEditingController hobby=TextEditingController();
  TextEditingController interest=TextEditingController();

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
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0,0),
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: ()
                        async {
                          b=await getFromGallery();
                          uploadList(b);

                        },
                        child: Text("Edit profile image"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: bio,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Edit bio',

                      ),
                      onTap: (){p=bio.text;},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                        controller: hobby,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Edit hobby',
                        ),
                        onTap: (){hobbies.add(hobby.text);}
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                        controller: interest,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Edit interest',
                        ),
                        onTap: (){interests.add(interest.text);}
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

                              if (interest.text == "" ||
                                  hobby.text == "") {
                                print("invalid");
                              }
                              else {
                                p = bio.text;
                                interests.add(interest.text);
                                hobbies.add(hobby.text);
                                url = await fetchItemList();

                                final FirebaseFirestore fire = FirebaseFirestore
                                    .instance;
                                final washingtonRef = fire.collection("users").doc(
                                    "${email1}");
                                washingtonRef.update({"picture": url}).then(
                                        (value) =>
                                        print(
                                            "DocumentSnapshot successfully updated!"),
                                    onError: (e) =>
                                        print("Error updating document $e"));
                                final bioref = fire.collection("users").doc(
                                    "${email1}");
                                bioref.update({"bio": p}).then(
                                        (value) =>
                                        print(
                                            "DocumentSnapshot successfully updated!"),
                                    onError: (e) =>
                                        print("Error updating document $e"));
                                final hobbiesref = fire.collection("users").doc(
                                    "${email1}");
                                hobbiesref.update({"hobbies": hobbies}).then(
                                        (value) =>
                                        print(
                                            "DocumentSnapshot successfully updated!"),
                                    onError: (e) =>
                                        print("Error updating document $e"));
                                final interestref = fire.collection("users").doc(
                                    "${email1}");
                                interestref.update({"interest": interests}).then(
                                        (value) =>
                                        print(
                                            "DocumentSnapshot successfully updated!"),
                                    onError: (e) =>
                                        print("Error updating document $e"));
                                fetchname(email1);
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
getFromGallery() async {
  final ImagePicker imgpicker = ImagePicker();
  var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
  if(pickedFile != null){
    final File imageFile = File(pickedFile.path);
    return imageFile;
  }else{
    print("No image is selected.");
  }
}
Future<void> uploadList(File file) async {
  final storage = FirebaseStorage.instance;
  final itemFolder = storage.ref().child('items/${email1}');
  final picName = '${email1}.jpg';
  final picRef = itemFolder.child(picName);
  final picUploadTask = picRef.putFile(file);
  await picUploadTask.whenComplete(() {});

}

Future<String> fetchItemList() async {
  final storage = FirebaseStorage.instance;
  final itemFolder = storage.ref().child('items/$email1');
  final picRef = itemFolder.child('$email1.jpg');
  final picUrl = await (await picRef).getDownloadURL();
  return picUrl;
}
fetchname(String email2) async {
  final FirebaseFirestore fire = FirebaseFirestore.instance;

  final docRef = fire.collection("users").doc("${email2}");
  docRef.get().then(
        (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      url=data['picture'];
      username=data['name'];
      userhobby=data['hobbies'];
      userinterest=data['interest'];
      userbio=data['bio'];
    },
    onError: (e) => print("Error getting document: $e"),
  );
}
// fetchevent(String eventname) async {
//   final FirebaseFirestore fire = FirebaseFirestore.instance;
//
//   final docRef = fire.collection("users").doc("${eventname}");
//   docRef.get().then(
//         (DocumentSnapshot doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       ename=data['eventname'];
//       eloc=data['eventlocation'];
//       edate=data['eventdate'];
//     },
//     onError: (e) => print("Error getting document: $e"),
//   );
// }
Future<List<Map<String, dynamic>>> fetchevent() async {
  QuerySnapshot<Map<String, dynamic>> usersSnapshot =
  await FirebaseFirestore.instance
      .collection('events')
      .get();
  List<Map<String, dynamic>> usersData =
  usersSnapshot.docs.map((doc) => doc.data()).toList();
  print(usersData);
  return (usersData);// Do something with the fetched data...
}
// fetchnews(List interest1) async {
//   final FirebaseFirestore fire = FirebaseFirestore.instance;
//
//   fire.collection("users").where("interest", whereIn: interest1).get().then(
//         (querySnapshot) {
//           print(querySnapshot.docs);
//       print("Successfully completed");
//       final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//
//       print(allData);
//
//     },
//     onError: (e) => print("Error completing: $e"),
//   );
//
// }
Future<List<Map<String, dynamic>>> fetchUsers(String interest1) async {
  QuerySnapshot<Map<String, dynamic>> usersSnapshot =
  await FirebaseFirestore.instance
      .collection('users')
      .where('interest', arrayContains: interest1)
      .get();
  List<Map<String, dynamic>> usersData =
  usersSnapshot.docs.map((doc) => doc.data()).toList();
  return (usersData);// Do something with the fetched data...
}