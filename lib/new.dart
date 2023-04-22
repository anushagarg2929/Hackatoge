import 'package:flutter/material.dart';

class MyHomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Elon Trump',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.star_border),
                hintText: 'Your Post',
              ),
            ),

            SizedBox(height: 12),
            Row(
              children: <Widget>[

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today),
                ),
                SizedBox(width: 12),
                Material(
                 child : Positioned(
                  bottom: 10,
                  right: 100,
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                    iconSize: 24,
                    padding: EdgeInsets.all(12),
                    color: Colors.blue,
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}