import 'package:flutter/material.dart';

class CoopDetail extends StatefulWidget {
  CoopDetail({Key key}) : super(key: key);
  @override
  _CoopDetailState createState() => _CoopDetailState();
}

enum CurrentIndex { one, two, three }

class _CoopDetailState extends State<CoopDetail> {
  bool oneValue = false;
  bool twoValue = false;
  bool threeValue = false;

  CurrentIndex currentIndex = CurrentIndex.one;

  _displayDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('예약 일자를 선택하라'),
            content: Column(
              children: <Widget>[
                //     Row(children: <Widget>[
                //       Checkbox(
                //           value: oneValue,
                //           onChanged: (bool newValue) {
                //             setState(() {
                //               oneValue = newValue;
                //             });
                //           }),
                //       Text('9/18-19(수,목)'),
                //     ]),
                //     Row(children: <Widget>[
                //       Checkbox(
                //           value: twoValue,
                //           onChanged: (bool newValue) {
                //             setState(() {
                //               twoValue = newValue;
                //             });
                //           }),
                //       Text('9/23-24(월,화)'),
                //     ]),
                //     Row(children: <Widget>[
                //       Checkbox(
                //           value: threeValue,
                //           onChanged: (bool newValue) {
                //             setState(() {
                //               threeValue = newValue;
                //             });
                //           }),
                //       Text('9/25-26(수-목)'),
                //     ]),

                ListTile(
                  title: Text("9/18-19(수,목)"),
                  leading: Radio(
                    value: CurrentIndex.one,
                    groupValue: currentIndex,
                    onChanged: (CurrentIndex value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("9/23-24(월,화)"),
                  leading: Radio(
                    value: CurrentIndex.two,
                    groupValue: currentIndex,
                    onChanged: (CurrentIndex value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("9/25-26(수-목)"),
                  leading: Radio(
                    value: CurrentIndex.three,
                    groupValue: currentIndex,
                    onChanged: (CurrentIndex value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.blue,
                child: Text(
                  '참가 신청',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/reserve');
                },
              ),
              FlatButton(
                child: new Text('취소'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Row(
          children: <Widget>[
            Text('              '),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9',
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.face,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2F%EA%B8%80%EC%93%B0%EA%B8%B0.png?alt=media&token=a162c03e-8b89-4050-86ed-c2cf1d41b40b',
                height: 200,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2Femoji.webp?alt=media&token=b1463c4a-6a28-4063-a355-31610f89520e',
                        height: 50,
                      ),
                      Text('the face'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("프로젝트",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("소개글"),
                      Text("구체적 설명"),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("협동 분야: 이 것은 데이터베이스 연동이 필요하다"),
              SizedBox(
                height: 10,
              ),
              Text("모집 인원: 가능하다"),
              SizedBox(
                height: 10,
              ),
              Text("모집 기간: 가능하다"),
            ],
          ), //firebase 연동시 add variables

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.people),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              SizedBox(
                width: 150,
              ),
              FloatingActionButton(
                onPressed: () {
                  _displayDialog(context);
                },
                child: Icon(Icons.schedule),
              ),
            ],
          ),
        ],
      ),
    );

    //image from fire storage
    /*3 columns w/ 
        image, 
        profile and detail(Row(Column)),
        pop, date(Column) 
  */
    //Row(floatingactionbutton, datepicker, profilepage)
  }
}

// import 'package:flutter/material.dart';

// class CoopDetail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
//             Navigator.pop(context);
//           }),
//           title: Image.network(
//               'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9'),
//         ),
//         body: Column(children: <Widget>[
//           Image.network('https://'),
//           Row(children: <Widget>[
//             Image.network('개인 프로필 사진'),
//             Column(children: <Widget>[
//               Text("Title", style: TextStyle(fontSize: 20, )),
//               Text("Introduction"),
//               Text("Content"),
//             ],),
//           ],),

//         ],),
//         //image from fire storage
//         /*3 columns w/
//         image,
//         profile and detail(Row(Column)),
//         pop, date(Column)
//   */
//   //Row(floatingactionbutton, datepicker, profilepage)

//       ),

//     );
//   }
// }

//  PopupMenuButton(
//                     child: Text('Some Button'),
//                     itemBuilder: (_) => [
//                       PopupMenuItem(
//                         child: Text('Item1'),
//                         value: 'item1',
//                       ),
//                       PopupMenuItem(child: Text('Item2'), value: 'item2'),
//                     ],
//                     onSelected: (value) =>
//                         Navigator.of(context).pushNamed(value),
//                   ),
