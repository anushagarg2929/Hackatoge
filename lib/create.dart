import 'package:flutter/material.dart';
import 'package:hacktoge/profile.dart';

import 'calender.dart';
import 'editprofile.dart';
import 'news.dart';
String post="";
class MyHomePage2 extends StatelessWidget {
  TextEditingController pos=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(url),
            ),
            Text(
              username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child:TextField(
                controller: pos,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write your post',
                ),
              ),
            ),
            SizedBox(height: 12,
              width: 20,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),

                Container(
                  decoration:BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(10)),),
                  child: IconButton(
                    onPressed: () {getFromGallery();},
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),

                Container(
                  decoration:BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(10)),),
                  child: IconButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  CalendarPage()),);
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                ),
                SizedBox(width: 230),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(decoration:BoxDecoration(
                      color: Color.fromRGBO(100, 181, 246, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),),
                      child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {post=pos.text;
                        pos.clear();

                        },
                        iconSize: 24,
                        padding: EdgeInsets.all(12),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}