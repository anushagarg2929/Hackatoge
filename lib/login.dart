import 'auto.dart';
import 'editprofile.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
String email1="";
String name="";
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override

  State<loginpage> createState() => _loginpageState();
}
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
bool _isLoading = false;


class _loginpageState extends State<loginpage> {
  void _logInUser() async {

    setState(() {
      _isLoading = true;
    });
    String result = await AuthMethods().logInUser(
      email: email.text,
      password: password.text,
    );
    if (result == 'success') {
      await fetchname(email.text);
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => const homescreen()),
      );
    }
    else{
      print(email.text);
      print(password.text);
    }

    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("Login Page")),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,

                      child: Image.asset('images/uplogo.png')),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter valid mail id as abc@gmail.com'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: password,

                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Padding(
                  padding:  EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: (
                          Text("Login")
                      ),
                      onPressed:() async {_logInUser();



                      }
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Padding(
                  padding:  EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: (
                          Text("Signup")
                      ),
                      onPressed:() async {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>  SignupScreen()),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}