
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'src/circular_percent_indicator.dart';


class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  File _image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar :AppBar(
          backgroundColor: const Color(0xFFFFFFFF),

      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:10),
              child: Column(
                mainAxisSize : MainAxisSize.max,
                mainAxisAlignment : MainAxisAlignment.center,
                children : <Widget>[
                  Container(
                    padding:EdgeInsets.only(top:10),
                    child : Stack(
                        children: <Widget>[
                          CircularPercentIndicator(
                            radius: 120,
                            lineWidth : 7.0,
                            percent : 0.7,
                            center : CircleAvatar(
                              backgroundImage : NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZFKB5YleBlsuHbYUTpLXgGzOWidgRx55ANwYn0F7-m5qUT7yT&s'),
                              radius: 53,
                            ),
                            progressColor : Color(0xff00b3e3),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor : Color(0xffc4c4c4),
                          ),]),
                  ),
                  Container(
                      padding:EdgeInsets.all(10),
                      child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget>[
                            Text('level 1',
                                style : TextStyle(
                                    fontSize:17,
                                    fontWeight:FontWeight.bold
                                )
                            ),
                            Text('@coding_jo_a',
                                style : TextStyle(
                                    fontSize:13,
                                    fontWeight:FontWeight.bold),

                            )]
                      )
                  ),
                ],
              ),
            ),


            Divider(),
            Row(
                children : <Widget> [
                  Container(
                      padding : EdgeInsets.fromLTRB(0,10,15,0),
                      child : Row(
                          children: <Widget>[
                            VerticalDivider(),
                            SizedBox(
                              width : 200,
                              height : 60,
                              child:
                              TextField(
                                  controller: _usernameController,
                                  decoration: InputDecoration.collapsed(
                                    hintText : '제목 입력',
                                    hintStyle:
                                    TextStyle(
                                      fontSize : 30,
                                      fontWeight:FontWeight.bold,
                                    ),
                                  ),
                                  textAlign:TextAlign.start,
                                  style: TextStyle(
                                    fontSize : 30,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),

                            ),
                          ]
                      )
                  )
                ]
            ),
            Divider(),
            Row(
                children : <Widget> [
                  Container(
                      padding : EdgeInsets.fromLTRB(0,10,15,0),
                      child : Row(
                          children: <Widget>[
                            SizedBox(
                              width : 200,
                              height :200,
                              child:
                              TextField(
                                  controller: _passwordController,
                                  decoration: InputDecoration.collapsed(
                                    hintText : '내용 입력',
                                    hintStyle:
                                    TextStyle(
                                      fontSize : 15,
                                    ),
                                  ),
                                  textAlign:TextAlign.start,
                                  style: TextStyle(
                                    fontSize : 15,
                                  )
                              ),

                            ),
                          ]
                      )
                  )
                ]
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Add AccentColorOverride (103)
