import 'package:flutter/material.dart';
import 'package:quit_smoking_app/services/database.dart';
import 'package:flutter/services.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({this.currentUserUID});
  final String currentUserUID;

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  String name = "Loading..";
  String cigPerDay = "Loading..";
  String pricePerPack = "Loading..";
  String cigPerPack = "Loading..";
  String currency = "Loading..";

  void initState() {
    print("Loading all async");

    //Loads the name
    DatabaseService(uid: widget.currentUserUID)
        .getName()
        .then((val) => setState(() {
              name = val;
            }));
    DatabaseService(uid: widget.currentUserUID)
        .getCigPerDay()
        .then((val) => setState(() {
              cigPerDay = val.toString();
            }));
    DatabaseService(uid: widget.currentUserUID)
        .getPricePerPack()
        .then((val) => setState(() {
              pricePerPack = val.toString();
            }));
    DatabaseService(uid: widget.currentUserUID)
        .getCigPerPack()
        .then((val) => setState(() {
              cigPerPack = val.toString();
            }));
    DatabaseService(uid: widget.currentUserUID)
        .getCurrency()
        .then((val) => setState(() {
              currency = val;
            }));

    return super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController cigPerDayController = TextEditingController();
  TextEditingController pricePerPackController = TextEditingController();
  TextEditingController cigPerPackController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    cigPerDayController.text = cigPerDay;
    pricePerPackController.text = pricePerPack;
    cigPerPackController.text = cigPerPack;
    currencyController.text = currency;
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              color: Colors.blueAccent,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
                        child: TextFormField(
                          autocorrect: false,
                          onChanged: (String value) {
                            name = value;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: TextField(
                          autocorrect: false,
                          onChanged: (String value) {
                            currency = value;
                          },
                          controller: currencyController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            labelText: 'Currency',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: TextField(
                          onChanged: (String value) {
                            cigPerDay = value;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: cigPerDayController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            labelText: 'Cig Per Day',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: TextField(
                          onChanged: (String value) {
                            pricePerPack = value;
                          },
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            WhitelistingTextInputFormatter(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ],
                          controller: pricePerPackController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            labelText: 'Price Per Pack',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            25, 0, 25, MediaQuery.of(context).size.height / 10),
                        child: TextField(
                          onChanged: (String value) {
                            cigPerPack = value;
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: cigPerPackController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            labelText: 'Cig Per Pack',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 20),
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width / 2.5,
                              20,
                              MediaQuery.of(context).size.width / 2.5,
                              20),
                          textColor: Colors.white,
                          color: Color(0xFF0EB29A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            DatabaseService(uid: widget.currentUserUID)
                                .updateProfile(
                              context: context,
                              cigPerDay: cigPerDay,
                              name: name,
                              cigPerPack: cigPerPack,
                              pricePerPack: pricePerPack,
                              currency: currency,
                            );
                          },
                          child: Text("SAVE"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget getUserImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              circle(),
              Icon(
                Icons.person,
                size: 80,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circle() {
    return Container(
      width: 150,
      height: 150,
      decoration: new BoxDecoration(
        color: Colors.grey[350],
        shape: BoxShape.circle,
      ),
    );
  }
}
