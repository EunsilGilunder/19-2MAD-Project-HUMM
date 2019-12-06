import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_project_humm/custom_widgets/form_submit_button.dart';
import 'package:mad_project_humm/read_more_text.dart';
import 'auth.dart';
import 'crud.dart';
import 'dart:async';

final snapshots = [
  {
    "profileurl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2Femoji.webp?alt=media&token=b1463c4a-6a28-4063-a355-31610f89520e",
    "title": "펜통",
    "intro": "소개글",
    "content":
        "일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보일시 및 상세 정보",
    "coopSpec": "디자인",
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
    "coopSpec": "디자인",
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
    "coopSpec": "디자인",
    "recruit": 5,
    "startDate": "5/5",
    "endDate": "5/6",
    "photourl":
        "https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Fexample_image%2F%EA%B8%80%EC%93%B0%EA%B8%B0.png?alt=media&token=a162c03e-8b89-4050-86ed-c2cf1d41b40b",
  },
];

class Coop {
  String profileurl;
  String title;
  String intro;
  String coopSpec;
  String content;
  int recruit;
  String startDate;
  String endDate;
  String photourl;
  DocumentReference reference;

  Coop.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['profileurl'] != null),
        assert(map['title'] != null),
        assert(map['intro'] != null),
        assert(map['coopSpec'] != null),
        assert(map['content'] != null),
        assert(map['recruit'] != null),
        assert(map['startDate'] != null),
        assert(map['endDate'] != null),
        assert(map['photourl'] != null),
        profileurl = map['profileurl'],
        title = map['title'],
        intro = map['intro'],
        coopSpec = map['coopSpec'],
        content = map['content'],
        recruit = map['recruit'],
        startDate = map['startDate'],
        endDate = map['endDate'],
        photourl = map['photourl'];

  Coop.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  // @override
  // String toString() => "Coop<$title: $intro>";
}

class CoopDetail extends StatefulWidget {
  CoopDetail({Key key}) : super(key: key);
  @override
  _CoopDetailState createState() => _CoopDetailState();
}

enum CurrentIndex { one, two, three }
class _CoopDetailState extends State<CoopDetail> {
  String title; //= Coop.fromSnapshot(연동시..);
  String uploader = displayName;
  String date; //= selected date..

  CrudMethod crudObj = CrudMethod();
  CurrentIndex currentIndex = CurrentIndex.one;

  Future<bool> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('예약 일자를 선택하라'),
            content: Column(
              children: <Widget>[
                RadioListTile(
                  title: Text("9/18-19(수,목)"),
                  value: CurrentIndex.one,
                  groupValue: currentIndex,
                  onChanged: (CurrentIndex value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("9/23-24(월,화)"),
                  value: CurrentIndex.two,
                  groupValue: currentIndex,
                  onChanged: (CurrentIndex value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                ),
                RadioListTile(
                  title: Text("9/25-26(수-목)"),
                  value: CurrentIndex.three,
                  groupValue: currentIndex,
                  onChanged: (CurrentIndex value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
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
                  Navigator.of(context).pop();
                  crudObj.addData({
                    'reservedBy': uploader,
                    'reserveDate': this.date,
                  }).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });
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

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('예약 완료', style: TextStyle(fontSize: 10.0)),
            actions: <Widget>[
              FlatButton(
                child: Text('확인'),
                textColor: Colors.black,
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
    final coop = Coop.fromMap(data);

    return Center(
      key: ValueKey(coop.title),
      child: Container(
        child: Card(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                            coop.profileurl,
                            height: 50,
                          ),
                          Text('face'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(coop.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(coop.intro),
                          Text("협동 분야: ${coop.coopSpec}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("모집 인원: ${coop.recruit.toString()} 명"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("모집 기간: ${coop.startDate} - ${coop.endDate}"),
                        ],
                      ), //firebase 연동시 add variables
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: ReadMoreText(
                      coop.content,
                      trimLines: 4,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
                      //   """${coop.content}""",
                      //   maxLines: 4,
                      //   softWrap: true,
                    ),
                  ),
                  FormSubmitButton(
                      onPressed: () {
                        _displayDialog(context);
                      },
                      text: "참가 신청"),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
