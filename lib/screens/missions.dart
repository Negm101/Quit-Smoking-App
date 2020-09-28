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
      height: MediaQuery.of(context).size.height/7,
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
          progressCircle(22.923423235),
      ],)
    );
  }

  Widget progressCircle(double percent){
    int percentPrint =  percent.toInt(); // casts percent to int for display
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 7.0,
      percent: percent/100,
      center: new Text('$percentPrint%'),
      progressColor: Colors.blueAccent,
    );
  }

}
