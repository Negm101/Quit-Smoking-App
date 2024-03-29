import 'package:flutter/material.dart';
import 'package:quit_smoking_app/screens/signuppage.dart';
import 'package:quit_smoking_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:quit_smoking_app/custom_icons.dart';

//context.read<AuthenticationService>().signOut();

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 75),
              Container(
                width: 200.00,
                height: 200.00,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(CustomIcons.profile),
                    filled: true,
                    fillColor: Color(0xFFF4F4F4),
                    labelText: 'Email Address',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 50),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    filled: true,
                    fillColor: Color(0xFFF4F4F4),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xFF0EB29A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: Text("Login"),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Don't have an account?"),
                        ),
                        FlatButton(
                          textColor: Color(0xFF0EB29A),
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text("Create one"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
