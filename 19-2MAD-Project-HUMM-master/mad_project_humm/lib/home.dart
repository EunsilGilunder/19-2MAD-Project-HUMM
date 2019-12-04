import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createStaete(){
    return _MainState();
  }
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
    print(_selectedEvents);
  }

  List _selectedEvents;
  DateTime _selectedDay;

  final Map _events = {
    DateTime(2019, 11, 31): [
      {'name': 'Event A', 'isDone': true},
    ],
    DateTime(2019, 12, 1): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2019, 12, 8): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
    ],
    DateTime(2019, 12, 4): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2019, 12, 25): [
      {'name': 'Event A', 'isDone': true},
      {'name': 'Event B', 'isDone': true},
      {'name': 'Event C', 'isDone': false},
    ],
    DateTime(2019, 11, 30): [
      {'name': 'Event A', 'isDone': false},
    ],
  };

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title : Center(child: Image.network('https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9')),
      ),

      drawer : Drawer(
        child : ListView(
          padding : EdgeInsets.zero,
          children: <Widget>[
            Container(

              child: DrawerHeader(
                padding: EdgeInsets.only(left:10),
                child : GestureDetector(
                  onTap:() {
                    Navigator.pushNamed(context,'./mypage');
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>
                    [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(

                            backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZFKB5YleBlsuHbYUTpLXgGzOWidgRx55ANwYn0F7-m5qUT7yT&s'),
                          radius: 35,
                        ),
                      ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:EdgeInsets.fromLTRB(10,0,10,8),
                          child: Text("@coding_jo_a",
                              style:TextStyle(color : Colors.white,
                                  fontWeight: FontWeight.bold,
                              fontSize: 20)
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(10,0,10,10),
                            child: Text("박민준 학부생님, 환영합니다!",
                          style:TextStyle(
                          color : Colors.white,
                        )
                        ))
                      ],
                    ),
                    ]
                  ),
                )
              ),
              color: Colors.blueAccent,
            ),
            GestureDetector(
              onTap:()=>Navigator.pushNamed(context,'./club'),
              child: ListTile(
                title: Text('동아리 보기',
                style:TextStyle(fontWeight:FontWeight.bold,
                fontSize:15)),
              ),
            ),
            ListTile(
                title: Text('체험하기',
    style:TextStyle(fontWeight:FontWeight.bold,
    fontSize:15)),
                onTap:(){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, './act');
                }
            ),
            ListTile(
                title: Text('함께하기',style:TextStyle(fontWeight:FontWeight.bold,
    fontSize:15)),
                onTap:(){
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: Text('내 활동',style:TextStyle(fontWeight:FontWeight.bold,
                    fontSize:15)),
                onTap:(){
                  Navigator.pop(context);
                }
            ),

          ]
        )
      ),


      body: ListView(
        children: <Widget>[
          Container(
            padding : EdgeInsets.all(10.0),
            child: Calendar(
                events: _events,
                onRangeSelected: (range) =>
                    print("Range is ${range.from}, ${range.to}"),
                onDateSelected: (date) => _handleNewDate(date),
                isExpandable: true,
                showTodayIcon: true,
                eventDoneColor: Colors.green,
                eventColor: Colors.grey),
          ),
          _buildEventList(),

          Container(
            child:Text('모집중'),
          ),
          CarouselSlider(
            height:200,
            items:[1].map((i){
              return Builder(
                  builder:(BuildContext context){
                    return Container(
                        width:MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child : Stack(
                            children:<Widget>[
                              Image.network('https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9'),
                              Text('동아리 배너')
                            ]

                        )
                    );
                  }
              );
            }).toList(),
          ),
          Container(
              child:Text('동아리 체험활동')
          ),
          CarouselSlider(
            height:200,
            items:[1].map((i){
              return Builder(
                  builder:(BuildContext context){
                    return Container(
                        width:MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child : Stack(
                            children:<Widget>[
                              Image.network('https://firebasestorage.googleapis.com/v0/b/project-humm.appspot.com/o/Image%2Flogo%2FHUMM_logo.png?alt=media&token=8e92cbfb-926d-4af1-9965-c5d7914e64b9'),
                              Text('동아리 배너')
                            ]

                        )
                    );
                  }
              );
            }).toList(),
          ),
        ],
      )
    );
  }

  Widget _buildEventList() {
    return SizedBox(
      height : 130,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding:
          const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            onTap: () {},
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}