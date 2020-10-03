/*
* This the main, it contains the bottom navigation bar and the container for other screens.
* Better to run this program on the resolution 720 x 1280: xhdpi as the front UI is built to work best with it
* For now this file doesn't need any changes
* */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quit_smoking_app/custom_icons.dart';
import 'package:quit_smoking_app/screens/missions.dart';
import 'package:quit_smoking_app/screens/progress.dart';
import 'package:quit_smoking_app/screens/schedule.dart';
import 'package:quit_smoking_app/screens/settings.dart';
import 'package:quit_smoking_app/screens/tips.dart';
import 'package:quit_smoking_app/screens/signinpage.dart';
import 'package:quit_smoking_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Quit Smoking App';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        title: _title,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MyStatefulWidget();
    }
    return SignInPage();
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ProgressContainerScreen(),
    TipsContainerScreen(),
    MissionsContainerScreen(),
    ScheduleContainerScreen(),
    SettingsContainerScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle =
        TextStyle(fontSize: 11.0); // text style for bottom nav bar for texts
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.progress),
              title: Text('Progress', style: textStyle),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.tips),
              title: Text('Tips', style: textStyle),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.adjust),
              title: Text(
                'Missions',
                style: textStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              title: Text(
                'Schedule',
                style: textStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.settings),
              title: Text('Settings', style: textStyle),
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed, // stops nav bar animation
          unselectedLabelStyle: textStyle,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
