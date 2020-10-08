import 'package:flutter/material.dart';

class TipsContainerScreen extends StatelessWidget {
  TipsContainerScreen({this.currentUserUID});
  final String currentUserUID;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(), //change scroll physics bouncy
      child: new Column(
        children: [
          singleTip(
            'Why is quitting so hard?',
            'We all know the health risks of smoking, but that does not make it any easier to kick the habit. Nicotine is addictive,'
                ' try to fight the next craving you have, and it will be easier to fight the next and next and next to come until you eventually'
                ' don\'t need it anymore.',
            AssetImage('assets/images/tips-1.jpg'),
            context,
          ),
          SizedBox(height: 25),
          singleTip(
            'Quitting smoking makes me feel uncomfortable...',
            'Flu, headache, trouble concentrating and more terrible things happening'
                ' to you ever since you started quiting smoking? What you are experiencing is the'
                ' withdrawal symptoms from nicotine. Trust me, it\'ll get better over time!',
            AssetImage('assets/images/tips-2.png'),
            context,
          ),
          SizedBox(height: 25),
        ],
      ),
      /* TODO: Start writing tips here */
    );
  }

  Widget singleTip(String tipsTitle, String tipsDescription,
      AssetImage displayImage, BuildContext context) {
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
                image: displayImage,
                // image: AssetImage('assets/images/tips-1.jpg'),
                fit: BoxFit.cover,
              ),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tipsTitle,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              SizedBox(height: 15),
              Text(
                tipsDescription.substring(0, 100) + '...',
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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(tipsTitle),
                      content: Text(tipsDescription),
                      actions: [
                        FlatButton(
                          child: Text("Ok, I won't give up!"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            },
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
