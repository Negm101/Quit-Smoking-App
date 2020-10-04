import 'package:flutter/material.dart';

class ScheduleContainerScreen extends StatefulWidget {
  const ScheduleContainerScreen({Key key}) : super(key: key);

  @override
  _ScheduleContainerState createState() => _ScheduleContainerState();
}

class _ScheduleContainerState extends State<ScheduleContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        ListView(
          physics: BouncingScrollPhysics(),
          children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 9.25,
              ),
              CustomListItem(
                labelNumber: '1',
                timeLeft: '14:00',
                timeRight: '13:22',
                isDivider: true,
              ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [topBar(context), bottomBarAddButton(context)],
        ),
      ],
    );
  }

  Widget topBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      height: MediaQuery
          .of(context)
          .size
          .height / 12,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.date_range,
                size: 30,
                color: Colors.blueAccent,
              ),
              Text(
                'Today',
                style: TextStyle(fontSize: 19, color: Colors.blueAccent),
              )
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.history,
              size: 30,
              color: Colors.blueAccent,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }


  Widget bottomBarAddButton(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height / 15,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .1,
            blurRadius: 8,
            offset: Offset(0, -8), // changes position of shadow
          ),
        ],
      ),
      child: FlatButton(
        onPressed: (){},
        child: Icon(
          Icons.add,
          color: Colors.greenAccent,
          size: 40,
        ),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  CustomListItem({
    @required this.labelNumber,
    @required this.timeLeft,
    @required this.timeRight,
    this.color = Colors.red,
    this.isDivider = false,
  });
  final String labelNumber;
  final String timeLeft;
  final String timeRight;
  final bool isDivider;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 20, right: 20, top: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Center(
                        child: Text(
                          labelNumber,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Text(timeLeft)
                ],
              ),
              Text(timeRight),
            ],
          ),
          customDivider(),
        ],
      )
    );
  }

  Widget customDivider(){
    if(isDivider == false){
      return Container();
    }
    else {
      return Divider(
        color: Colors.grey,
      );
    }
  }
}
