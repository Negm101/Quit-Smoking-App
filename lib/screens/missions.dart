import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MissionsContainerScreen extends StatelessWidget {
  MissionsContainerScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar(context),
      ],
    );

  }

  Widget topBar(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      height: MediaQuery.of(context).size.height/6,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
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
                Text('Main', style: TextStyle(fontSize: 18),),
                Text('Mission', style: TextStyle(fontSize: 18),),
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
                Text('Total 30 days', style: TextStyle(fontSize: 10),),
                Text('20', style: TextStyle(fontSize: 22, color: Colors.blueAccent, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
      ],)
    );
  }
  Widget shortTermGoals(BuildContext context, Color priorityColor, String title){
    return Container(
      height: MediaQuery.of(context).size.height/10,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .1,
            blurRadius: 8,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
    );
  }

  Widget progressCircle(double percent){
    int percentPrint =  percent.toInt(); // casts percent to int for display
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      radius: 80.0,
      lineWidth: 8.0,
      percent: percent/100,
      //animation: true,
      //animationDuration: 750,
      center: new Text('$percentPrint%', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      progressColor: Colors.blueAccent,
    );
  }

}
