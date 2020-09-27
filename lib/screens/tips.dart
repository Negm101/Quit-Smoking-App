import 'package:flutter/material.dart';

class TipsContainerScreen extends StatelessWidget {
  TipsContainerScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: [
          singleTip(),
          SizedBox(height: 25),
          singleTip(),
          SizedBox(height: 25),
          singleTip(),
        ],
      ),
      /* TODO: Start writing tips here */
    );
  }

  Widget singleTip() {
    return Container(
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
      child: Column(children: [
        Container(
            width: double.infinity,
            height: 200.00,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: AssetImage('assets/images/tips-1.jpg'),
                fit: BoxFit.cover,
              ),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Why is quitting so hard?',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              SizedBox(height: 15),
              Text(
                'We all know the health risks of smoking, but that doesn’t make it any easier to kick the habit....',
                style:
                    TextStyle(fontSize: 18, color: Colors.black54, height: 1.3),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: 350,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.5),
            ),
            color: Colors.grey,
            padding: EdgeInsets.all(0),
            onPressed: () {},
            child: Text(
              'More',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 25),
      ]),
    );
  }
}
