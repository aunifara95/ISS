import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class Dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Dashboard>{

  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body:
      SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only( bottom: 5),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text("Where is the ISS?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                        child: TextButton.icon(
                          icon: Icon(
                            Icons.event_note,
                            color: Colors.black87,
                          ),
                          label: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87
                            ),
                          ),
                          style: ButtonStyle(
                            //padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: BorderSide(color: Colors.blueAccent)
                                  )
                              )
                          ),
                          onPressed:() => _selectDate(context),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}