import 'package:flutter/material.dart';
import 'package:quit_smoking_app/custom_icons.dart';
import 'package:provider/provider.dart';
import 'package:quit_smoking_app/services/auth.dart';

class ProgressContainerScreen extends StatelessWidget {
  ProgressContainerScreen();

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            height: MediaQuery.of(context).size.height,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                progressList(CustomIcons.money, 'Money Saved', 'RM 22'),
                progressList(
                    CustomIcons.cigareette, 'Non-Smoked Cigarettes', '22'),
                progressList(Icons.timeline, 'Life Regained', '10 Days'),
                progressList(CustomIcons.relapsed, 'Relapsed', '3'),
              ],
            ),
          ),
          Column(
            children: [
              /* Top bar */
              Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(bottom: 10),
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // share and edit profile button
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon:
                                Icon(CustomIcons.profile, color: Colors.white),
                            padding: EdgeInsets.only(bottom: 0),
                            onPressed: () {
                              context.read<AuthenticationService>().signOut();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              CustomIcons.share,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.only(bottom: 0),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    // days counter display
                    Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20 Days',
                            style: TextStyle(fontSize: 45, color: Colors.white),
                          ),
                          Text(
                            'Since Your Last Cigarette',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                    // I smoked button
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 43,
                      child: FlatButton(
                        color: Colors.redAccent,
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          showDialogSmoked(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 22,
                            ),
                            Text(
                              ' I SMOKED',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget progressList(IconData icon, String title, String number) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          circle,
          Icon(icon, color: Colors.grey[600]),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        number,
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget circle = new Container(
    width: 45,
    height: 45,
    decoration: new BoxDecoration(
      color: Colors.grey[350],
      shape: BoxShape.circle,
    ),
  );

  showDialogSmoked(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            contentPadding: EdgeInsets.only(top: 0.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Color(0xFF0EB29A),
                    child: Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: new Icon(
                            CustomIcons.relapsed,
                            color: Color(0xFF0EB29A),
                          ),

                          /*Text(
                            "!",
                            style: TextStyle(
                                fontSize: 30.0, color: Color(0xFF0EB29A)),
                          ),*/
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Center(
                      child: Text(
                        "Don’t worry, it’s not the end",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF000000)),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      child: Text(
                        "Quitting is hard we know, but you can do it! This does not mean you failed quitting smoke, don’t give up! ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF000000).withOpacity(0.60),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: 200,
                    height: 30,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.5),
                      ),
                      color: Color(0xFF0EB29A),
                      child: Text(
                        "SMOKED",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF000000).withOpacity(0.50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
