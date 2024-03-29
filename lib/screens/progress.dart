import 'package:flutter/material.dart';
import 'package:quit_smoking_app/custom_icons.dart';
import 'package:provider/provider.dart';
import 'package:quit_smoking_app/services/auth.dart';
import 'package:intl/intl.dart';
import 'package:quit_smoking_app/services/database.dart';

class ProgressContainerScreen extends StatefulWidget {
  ProgressContainerScreen({this.currentUserUID});
  final String currentUserUID;

  @override
  _ProgressContainerScreenState createState() =>
      _ProgressContainerScreenState();
}

class _ProgressContainerScreenState extends State<ProgressContainerScreen> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String daysSinceSmokedText = "Loading..";
  String moneySaved = "Loading..";
  String nonSmokedCig = "Loading..";
  String lifeRegained = "Loading..";
  String name = "Human Being";

  _ProgressContainerScreenState();

  initState() {
    super.initState();
    print("Loading all async");

    //Loads the name
    DatabaseService(uid: widget.currentUserUID)
        .getName()
        .then((val) => setState(() {
              name = val;
            }));

    loadData();
  }

  loadData() {
    getDaysSinceSmoked().then((val) => setState(() {
          daysSinceSmokedText = val;
        }));

    getMoneySaved().then((val) => setState(() {
          moneySaved = val;
        }));

    getNonSmokedCig().then((val) => setState(() {
          nonSmokedCig = val;
        }));

    getLifeRegained().then((val) => setState(() {
          lifeRegained = val;
        }));
  }

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
              children: [SizedBox(height: 80), completeList()],
            ),
          ),
          Column(
            children: [
              /* Top bar */
              Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(bottom: 10),
                height: MediaQuery.of(context).size.height / 3.2,
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
                            onPressed: () async {
                              final userUID = await context
                                  .read<AuthenticationService>()
                                  .getCurrentUID();
                              logoutButton(context, userUID);
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
                            daysSinceSmokedText,
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
                        onPressed: () async {
                          final userUID = await context
                              .read<AuthenticationService>()
                              .getCurrentUID();
                          showDialogSmoked(context, userUID);
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

  Widget completeList() {
    return Container(
      height: 300,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          progressList(
            CustomIcons.money,
            'Money Saved',
            moneySaved,
          ),
          progressList(
            CustomIcons.cigareette,
            'Non-Smoked Cigarettes',
            nonSmokedCig,
          ),
          progressList(
            Icons.timeline,
            'Life Regained',
            lifeRegained,
          ),
          progressList(
            CustomIcons.relapsed,
            'Relapsed',
            'Coming Soon',
          ),
        ],
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

  showDialogSmoked(BuildContext context, String userUID) {
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
                      onPressed: () async {
                        await DatabaseService(uid: userUID).addSmokingRecord();
                        // getDaysSinceSmoked().then((val) => setState(() {
                        //       daysSinceSmokedText = val;
                        //     }));
                        loadData();
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

  Future<String> getDaysSinceSmoked() async {
    return await DatabaseService(uid: widget.currentUserUID)
        .getDaysSinceSmoked();
  }

  Future<String> getMoneySaved() async {
    return await DatabaseService(uid: widget.currentUserUID).getMoneySaved();
  }

  Future<String> getNonSmokedCig() async {
    return await DatabaseService(uid: widget.currentUserUID).getNonSmokedCig();
  }

  Future<String> getLifeRegained() async {
    return await DatabaseService(uid: widget.currentUserUID).getLifeRegained();
  }

  logoutButton(BuildContext context, String userUID) {
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
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Center(
                      child: Text(
                        "Sign out?",
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
                        "Quitting is hard we know, don't give up!",
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
                        "Sign Out",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () async {
                        context.read<AuthenticationService>().signOut();
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
