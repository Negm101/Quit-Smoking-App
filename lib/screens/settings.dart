import 'package:flutter/material.dart';
import 'package:quit_smoking_app/screens/user_profile.dart';

class SettingsContainerScreen extends StatelessWidget {
  SettingsContainerScreen();

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        CustomButton(
          title: 'Edit Profile',
          icon: Icons.person,
          context: context,
          elevation: 0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfileScreen()),
            );
          },
        ),
        CustomButton(
          title: 'Support Connection',
          icon: Icons.local_library,
          context: context,
          elevation: 0,
          onPressed: (){},
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    Key key,
    this.elevation = 8,
    this.onPressed,
    @required this.icon,
    @required this.title,
    @required this.context,
  });

  final IconData icon;
  final String title;
  final double elevation;
  final BuildContext context;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.only(left: 0, right: 0),
      onPressed: () {
        onPressed();
      },
      color: Colors.grey[100],
      elevation: elevation,
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.grey,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
