import 'editprofile.dart';
import 'main.dart';
import 'package:flutter/material.dart';
String sinterest="";
List<Map> items=[];
class group extends StatefulWidget {
  const group({Key? key}) : super(key: key);
  @override
  State<group> createState() => _groupState();
}


class _groupState extends State<group> {
  TextEditingController searchinterest = TextEditingController();
  Future<void> getItemList(String interest) async {
    List<Map> fetchedItemList=await fetchUsers(interest);
    setState(() {
      items = fetchedItemList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: 1000,
            width: 1000,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: searchinterest,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(200.0))
                          ),
                          suffixIcon: IconButton(onPressed: () async {
                            print(items);
                          }, icon: Icon(Icons.send)),
                          labelText: 'Search Interest',
                        ),
                        onTap: () {
                          setState(() async {
                            sinterest = searchinterest.text;
                            getItemList(sinterest);
                          });
                        },
                        onSubmitted: (String str){
                          sinterest=str;
                          getItemList(sinterest);
                        },

                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 500,
                        child: ListView.separated(
                            padding: const EdgeInsets.all(8),
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            items[index]['picture']),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),

                                          Text(items[index]['name'],
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          // Container(
                                          //   height:50,
                                          //   width: 100,
                                          //   child: Text(items[index]['interest'][0]),
                                          // ),
                                          Container(
                                              height: 50,
                                              width: 200,
                                              child: ListView.separated(
                                                  scrollDirection: Axis.horizontal,
                                                  padding: const EdgeInsets.all(2),
                                                  itemCount: items[index]['interest'].length,
                                                  itemBuilder: (BuildContext context, int index1) {
                                                    return Container(
                                                        child:Row(
                                                          children: [
                                                            Text(items[index]['interest'][index1]),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Icon(Icons.circle,
                                                                size: 8,
                                                              ),
                                                            ),

                                                          ],
                                                        )

                                                    );
                                                  },
                                                  separatorBuilder: (BuildContext context,int index) => const Divider()))
                                        ],
                                      )
                                    ],
                                  )

                                ],
                              );
                            },
                            separatorBuilder: (BuildContext context,
                                int index) => const Divider()
                        ),
                      ),
                    ),

                  ]
              ),
            )
        )
    );
  }
}