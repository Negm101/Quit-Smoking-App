import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quit_smoking_app/screens/custom_matrials.dart';
class MissionsContainerScreen extends StatefulWidget {
  const MissionsContainerScreen({Key key}) : super(key: key);

  @override
  _MissionsContainerState createState() => _MissionsContainerState();
}

class _MissionsContainerState extends State<MissionsContainerScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 6.1,
              bottom: MediaQuery.of(context).size.height / 15),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 25,
                    bottom: MediaQuery.of(context).size.height / 40,
                    top: MediaQuery.of(context).size.height / 40),
                child: Text('Short-term goals',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              CustomTiles(
                title: 'Hey There',
                priorityColor: Colors.red,
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topBar(context),
            bottomBarAddButton(context),
          ],
        ),
      ],
    );
  }

  Widget topBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 60),
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            /* Main mission text*/
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Main',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Mission',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            /* progress circle */
            progressCircle(66),
            /* total days + completed days*/
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total 30 days',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    '20',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget bottomBarAddButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
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

  Widget progressCircle(double percent) {
    int percentPrint = percent.toInt(); // casts percent to int for display
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      radius: 80.0,
      lineWidth: 8.0,
      percent: percent / 100,
      animation: true,
      animationDuration: 800,
      center: new Text(
        '$percentPrint%',
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      progressColor: Colors.blueAccent,
    );
  }
}

