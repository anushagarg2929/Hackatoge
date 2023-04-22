
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> calenderevent({
    required String? eventname,
    required String? eventaddress,
    required String? eventdate,

  }) async {
    String result = 'Some error occurred';
    eventModel eventModel1 = eventModel(
      eventname: eventname!,
      eventaddress: eventaddress!,
      eventdate: eventdate!,
    );

    await _firestore.collection('events').doc(eventname).set(
      eventModel1.toJson(),
    );
    result = 'success';

    return result;
  }
  Future<String> signUpUser({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email!.isNotEmpty || name!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password!);
        print(user.user!.uid);

        UserModel userModel = UserModel(
          email: email,
          name: name!,
          uid: user.user!.uid,
          followers: [],
          following: [],
          pic: "",
          interests:[],
          hobbies:[],
        );

        await _firestore.collection('users').doc(email).set(
          userModel.toJson(),
        );
        result = 'success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        email1=email;

        result = 'success';
      }
    } catch (err) {
      result = "fail";
    }
    return result;
  }
}
class eventModel {
  final String eventdate;
  final String eventname;
  final String eventaddress;

  eventModel({
    required this.eventname,
    required this.eventdate,
    required this.eventaddress,
  });

  Map<String, dynamic> toJson() => {
    "eventdate": eventdate,
    "eventname": eventname,
    "eventaddress": eventaddress,
  };

  static eventModel? fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return eventModel(
      eventname: snapshot['eventname'],
      eventaddress: snapshot['eventaddress'],
      eventdate: snapshot['eventdate'],
    );
  }
}
class UserModel{
  final String email;
  final String name;
  final String uid;
  final List followers;
  final List following;
  final String pic="";
  final List interests=[];
  final List hobbies=[];
  UserModel(
      {required this.email,
        required this.name,
        required this.uid,
        required this.followers,
        required this.following, required pic, required List hobbies, required List interests});

  Map<String, dynamic> toJson() => {
    "email": email,
    "uid": uid,
    "name": name,
    "followers": followers,
    "following": following,
    "picture": pic,
  };

  static UserModel? fromSnap (DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot['uid'],
      name: snapshot['name'],
      following: snapshot['following'],
      followers: snapshot['followers'],
      email: snapshot['email'],
      pic:snapshot['picture'],
      hobbies: snapshot['hobbies'],
      interests: snapshot['interests'],

    );
  }
}