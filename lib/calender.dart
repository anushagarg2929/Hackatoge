import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'editprofile.dart';
import 'event.dart';
List<Map> eve=[];

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Future<void> getItemList1() async {
    List<Map> fetchedItemList=await fetchevent();
    setState(() {
      eve = fetchedItemList;
    });
  }
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Table(
                    border: TableBorder.all(),
                    children: List.generate(6, (rowIndex) {
                      return TableRow(
                        children: List.generate(7, (colIndex) {
                          DateTime date = DateTime(_selectedDate.year, _selectedDate.month, 1);
                          int dayOfWeek = date.weekday - 1;
                          int offset = rowIndex * 7 + colIndex - dayOfWeek;
                          DateTime cellDate = date.add(Duration(days: offset));

                          return Container(
                            height: 50.0,
                            alignment: Alignment.center,
                            color: cellDate.month == _selectedDate.month ? Colors.white : Colors.grey[300],
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedDate = cellDate;
                                });
                              },
                              child: Text(
                                DateFormat('d').format(cellDate),
                                style: TextStyle(
                                  color: cellDate.month == _selectedDate.month ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ),
              ),
              Container(
                width: 250,
                child: Padding(
                  padding:  EdgeInsets.all(10),
                  child: ElevatedButton(
                      child: (
                          Text("Create an Event")
                      ),
                      onPressed:() async {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>  eventpage()),
                        );
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
                          Text("load")
                      ),
                      onPressed:() async {
                        getItemList1();

                      }
                  ),
                ),
              ),
              Container(
                height: 500,
                child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: eve.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                          children: [
                            Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                      height: 100,
                                      width:300,
                                      decoration:BoxDecoration(
                                        color: Colors.grey.withOpacity(0.7),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),

                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [ SizedBox(
                                              width: 5,
                                            ),
                                              Text('Event name : ',
                                                style: TextStyle(
                                                    fontSize: 22
                                                ),),
                                              Text(eve[index]['eventname'],
                                                style: TextStyle(
                                                    fontSize: 22
                                                ),),],
                                          ),

                                          // Container(
                                          //   height:50,
                                          //   width: 100,
                                          //   child: Text(items[index]['interest'][0]),
                                          // ),
                                          Row(
                                            children: [ SizedBox(
                                              width: 5,
                                            ),
                                              Text('Event Location : ',
                                                style: TextStyle(
                                                    fontSize: 22
                                                ),),
                                              Text(eve[index]['eventaddress'],
                                                style: TextStyle(
                                                    fontSize: 22
                                                ),),],),
                                          Row(
                                            children: [ SizedBox(
                                              width: 5,
                                            ),
                                              Text('Event Date : ',
                                                style: TextStyle(
                                                    fontSize: 22
                                                ),),
                                              Text(eve[index]['eventdate'],
                                                style: TextStyle(
                                                    fontSize: 22
                                                ),),],



                                          ),
                                        ],
                                      )

                                  )
                                ]
                            )
                          ]
                      );
                    },
                    separatorBuilder: (BuildContext context,
                        int index) => const Divider()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}