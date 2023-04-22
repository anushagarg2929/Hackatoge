import 'package:hacktoge/editprofile.dart';

import 'main.dart';
import 'package:flutter/material.dart';

import 'news.dart';

class newsarticle extends StatelessWidget {
  const newsarticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 3000,
        child: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("back",
                      style: TextStyle(
                          fontSize: 20
                      ),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.favorite_border_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.share)

                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(st4,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.height,
                  child: Image.network("https://images.firstpost.com/wp-content/uploads/2023/04/MS-Dhoni3.jpg?impolicy=website&width=320&height=180",
                    fit: BoxFit.fitWidth,),
                ),
              ),
              Container(
                height: 250,
                child: Flex(
                    direction: Axis.vertical,
                    children: [Flexible(child: Text(st2,
                      style: TextStyle(fontSize: 16),)),]
                ),
              ),
              Text("Author",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 75,
                  width: MediaQuery.of(context).size.height,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius:30,
                        backgroundImage: NetworkImage(url),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(username,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox(
                            height: 5,
                          ),
                          Text("3000 friends",
                            style: TextStyle(
                                fontSize: 18
                            ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}