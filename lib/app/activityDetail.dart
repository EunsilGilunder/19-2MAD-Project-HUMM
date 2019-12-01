import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project_humm/custom_widgets/form_submit_button.dart';

final snapshots = [
  {
    "profileurl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2Femoji.webp?alt=media&token=b1463c4a-6a28-4063-a355-31610f89520e",
    "title": "펜통",
    "intro": "소개글",
    "content":
        '''일시 및 상세 정보 from snapshot일시 및 상세 정보 from snapshot일시 및 상세 정보 from snapshot일시 및 상세 정보 from snapshot일시 및 상세 정보 from snapshot일시 및 상세 정보 from snapshot일시 및 상세 정보 from snapshot''',
    "recruit": 5,
    "startDate": "5/5",
    "endDate": "5/6",
    "photourl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2F%EA%B8%80%EC%93%B0%EA%B8%B0.png?alt=media&token=a162c03e-8b89-4050-86ed-c2cf1d41b40b",
  },
  {
    "profileurl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2Femoji.webp?alt=media&token=b1463c4a-6a28-4063-a355-31610f89520e",
    "title": "펜통",
    "intro": "소개글",
    "content": "일시 및 상세 정보",
    "recruit": 5,
    "startDate": "5/5",
    "endDate": "5/6",
    "photourl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2F%EA%B8%80%EC%93%B0%EA%B8%B0.png?alt=media&token=a162c03e-8b89-4050-86ed-c2cf1d41b40b",
  },
  {
    "profileurl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2Femoji.webp?alt=media&token=b1463c4a-6a28-4063-a355-31610f89520e",
    "title": "펜통",
    "intro": "소개글",
    "content": "일시 및 상세 정보",
    "recruit": 5,
    "startDate": "5/5",
    "endDate": "5/6",
    "photourl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2F%EA%B8%80%EC%93%B0%EA%B8%B0.png?alt=media&token=a162c03e-8b89-4050-86ed-c2cf1d41b40b",
  },
];

class Activity {
  String profileurl;
  String title;
  String intro;
  String content;
  int recruit;
  String startDate;
  String endDate;
  String photourl;
  DocumentReference reference;

  Activity.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['profileurl'] != null),
        assert(map['title'] != null),
        assert(map['intro'] != null),
        assert(map['content'] != null),
        assert(map['recruit'] != null),
        assert(map['startDate'] != null),
        assert(map['endDate'] != null),
        assert(map['photourl'] != null),
        profileurl = map['profileurl'],
        title = map['title'],
        intro = map['intro'],
        content = map['content'],
        recruit = map['recruit'],
        startDate = map['startDate'],
        endDate = map['endDate'],
        photourl = map['photourl'];

  Activity.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // @override
  // String toString() => "Coop<$title: $intro>";
}

class ActivityDetail extends StatefulWidget {
  ActivityDetail({Key key}) : super(key: key);
  @override
  _ActivityDetailState createState() => _ActivityDetailState();
}

enum CurrentIndex { one, two, three }

class _ActivityDetailState extends State<ActivityDetail> {
  CurrentIndex currentIndex = CurrentIndex.one;

  _displayDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('예약 일자를 선택하라'),
            content: Column(
              children: <Widget>[
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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return _buildList(context, snapshots);
  }

  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Map data) {
    final activity = Activity.fromMap(data);

    return Padding(
      key: ValueKey(activity.title),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
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
                        activity.profileurl,
                        height: 50,
                      ),
                      Text('the face'),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(activity.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(activity.intro),
                        Text(activity.content),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text("모집 인원: ${activity.recruit.toString()} 명"),
              SizedBox(
                height: 10,
              ),
              Text("모집 기간: ${activity.startDate} - ${activity.endDate}"),
            ],
          ), //firebase 연동시 add variables

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 150,
              ),
              FormSubmitButton(
                  onPressed: () {
                    _displayDialog(context);
                  },
                  text: "참가 신청"),
            ],
          ),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
            height: 20,
          ),
        ],
      ),
    );
  }
}

// class CoopDetail extends StatefulWidget {
//   CoopDetail({Key key}) : super(key: key);
//   @override
//   _CoopDetailState createState() => _CoopDetailState();
// }

// enum CurrentIndex { one, two, three }

// class _CoopDetailState extends State<CoopDetail> {
//   bool oneValue = false;
//   bool twoValue = false;
//   bool threeValue = false;

//   CurrentIndex currentIndex = CurrentIndex.one;

//   _displayDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('예약 일자를 선택하라'),
//             content: Column(
//               children: <Widget>[
//                 ListTile(
//                   title: Text("9/18-19(수,목)"),
//                   leading: Radio(
//                     value: CurrentIndex.one,
//                     groupValue: currentIndex,
//                     onChanged: (CurrentIndex value) {
//                       setState(() {
//                         currentIndex = value;
//                       });
//                     },
//                   ),
//                 ),
//                 ListTile(
//                   title: Text("9/23-24(월,화)"),
//                   leading: Radio(
//                     value: CurrentIndex.two,
//                     groupValue: currentIndex,
//                     onChanged: (CurrentIndex value) {
//                       setState(() {
//                         currentIndex = value;
//                       });
//                     },
//                   ),
//                 ),
//                 ListTile(
//                   title: Text("9/25-26(수-목)"),
//                   leading: Radio(
//                     value: CurrentIndex.three,
//                     groupValue: currentIndex,
//                     onChanged: (CurrentIndex value) {
//                       setState(() {
//                         currentIndex = value;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               FlatButton(
//                 color: Colors.blue,
//                 child: Text(
//                   '참가 신청',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/reserve');
//                 },
//               ),
//               FlatButton(
//                 child: new Text('취소'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         title: Row(
//           children: <Widget>[
//             Text('              '),
//             Image.network(
//               'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9',
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(
//                 Icons.face,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/profile');
//               }),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Image.network(
//                 'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2F%EA%B8%80%EC%93%B0%EA%B8%B0.png?alt=media&token=a162c03e-8b89-4050-86ed-c2cf1d41b40b',
//                 height: 200,
//                 fit: BoxFit.fill,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       Image.network(
//                         'https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2Femoji.webp?alt=media&token=b1463c4a-6a28-4063-a355-31610f89520e',
//                         height: 50,
//                       ),
//                       Text('the face'),
//                     ],
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Text("프로젝트",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Text("소개글"),
//                       Text("구체적 설명"),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text("협동 분야: 이 것은 데���터베이스 연동이 필요하다"),
//               SizedBox(
//                 height: 10,
//               ),
//               Text("모집 인원: 가능하다"),
//               SizedBox(
//                 height: 10,
//               ),
//               Text("모집 ���간: 가능하다"),
//             ],
//           ), //firebase 연동시 add variables

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.people),
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/profile');
//                 },
//               ),
//               SizedBox(
//                 width: 150,
//               ),
//               FloatingActionButton(
//                 onPressed: () {
//                   _displayDialog(context);
//                 },
//                 child: Icon(Icons.schedule),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
