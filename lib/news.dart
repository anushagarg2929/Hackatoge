import 'editprofile.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'newsarticle.dart';

String st="We all knew it was coming. After Microsoft and Google both debuted their own respective AI projects, up steps Amazon. One of its new tools is called CodeWhisperer and it's a direct competitor for Microsoft-owned GitHub's AI Copilot.There's one key area Amazon has completely one-upped GitHub, though. CodeWhisperer is (at least for the time being) free to use for individuals. GitHub Copilot requires a subscription which starts at 10 a month or 100 a year. That's a pretty big deal and is sure to prick up more than a few ears.Trained on billions of lines of code and powered by machine learning, CodeWhisperer has the same goal. Whether you are a student, a new developer, or an experienced professional, CodeWhisperer will help you to be more productive.CodeWhisperer will continually examine your code and your comments, and present you with syntactically correct recommendations. The recommendations are synthesized based on your coding style and variable names, and are not simply snippets.";
String st2="It was a quick journey back to the days of neat finishes by former Indian captain Mahendra Singh Dhoni when he was on the crease and his team Chennai Super Kings (CSK) needed five of one ball to defeat Rajasthan Royals (RR) on Wednesday. The nostalgia-inspiring spectacle attracted around 2.2 crore people to stick to the screens expecting to watch the past relived live on JioCinema.";
String st3="Get together Coding at IITM";
String st4="Over 2 crore viewers watch MS Dhoni play";
class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1200,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap:(){            Navigator.push(context, MaterialPageRoute(builder: (context) =>  newsarticle()),);
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),


                  height: 400,
                  width: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(

                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(url),
                              radius: 25,
                            ),
                          ),
                          Text(username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Get together Coding at IITM",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.height,
                          child: Image.network("https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y29kaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fitWidth,),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite_border_outlined),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.maps_ugc_outlined),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.share),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReadMoreText(st,
                          trimLines: 2,
                          style: TextStyle(color: Colors.black),
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Show more',
                          trimExpandedText: ' show less',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) =>  newsarticle()),);
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),


                  height: 400,
                  width: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(url),
                              radius: 25,
                            ),
                          ),
                          Text(username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Flexible(child: Text("Over 2 crore viewers watch MS Dhoni play ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.height,
                        child: Image.network("https://images.firstpost.com/wp-content/uploads/2023/04/MS-Dhoni3.jpg?impolicy=website&width=320&height=180",
                          fit: BoxFit.fitWidth,),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite_border_outlined),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.maps_ugc_outlined),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.share),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReadMoreText(st2,
                          trimLines: 2,
                          style: TextStyle(color: Colors.black),
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Show more',
                          trimExpandedText: ' show less',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}