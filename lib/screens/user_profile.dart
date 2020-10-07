import 'package:flutter/material.dart';
import 'package:quit_smoking_app/services/database_helper.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cigPerDayController = TextEditingController();
  TextEditingController pricePerPackController = TextEditingController();
  TextEditingController cigPerPackController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        child: TextField(
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
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: TextField(
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
                            DatabaseHelper authenticationService =
                                new DatabaseHelper();
                            authenticationService.updateUserProfile(
                                nameController.text.toString(),
                                emailController.text.toString(),
                                cigPerDayController.text.toString(),
                                pricePerPackController.text.toString(),
                                cigPerPackController.text.toString(),
                                currencyController.text.toString());
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
