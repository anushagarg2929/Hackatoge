// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   TextEditingController _controller = TextEditingController();
//   List<String> _messages = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         setState(() {
//           _messages.add(message["notification"]["body"]);
//         });
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         setState(() {
//           _messages.add(message["notification"]["body"]);
//         });
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//         setState(() {
//           _messages.add(message["notification"]["body"]);
//         });
//       },
//     );
//     _firebaseMessaging.requestNotificationPermissions(
//         const IosNotificationSettings(sound: true, badge: true, alert: true));
//   }
//
//   void _sendMessage() {
//     _firebaseMessaging.getToken().then((token) {
//       print("Firebase Messaging Token: $token");
//       _firebaseMessaging.subscribeToTopic("all");
//       _firebaseMessaging.subscribeToTopic("flutter");
//       _firebaseMessaging.subscribeToTopic("chat");
//       _firebaseMessaging.subscribeToTopic("test");
//
//       _firebaseMessaging.sendMessage(
//         to: "/topics/chat",
//         data: {
//           "body": _controller.text,
//           "title": "FlutterChatApp",
//         },
//         notification: {
//           "body": _controller.text,
//           "title": "FlutterChatApp",
//         },
//       );
//
//       setState(() {
//         _messages.add(_controller.text);
//         _controller.clear();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Chat App"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: Text(_messages[index]),
//                 );
//               },
//             ),
//           ),
//           Divider(),
//           ListTile(
//             title: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: "Enter a message",
//               ),
//             ),
//             trailing: IconButton(
//               icon: Icon(Icons.send),
//               onPressed: _sendMessage,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }