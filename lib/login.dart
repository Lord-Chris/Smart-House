import 'package:flutter/material.dart';
import 'package:smart_house/signup.dart';

import 'constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BEIGE,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [GREEN,BEIGE],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   // stops: [
            //   //   0.5,0.7
            //   // ]
            // ),
            ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    'Smart Home',
                    style: TextStyle(
                      color: BLUE,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, top: 50),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: fieldDecor),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, top: 30),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: fieldDecor,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(60.0),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    color: ORANGE,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: BEIGE,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        // fontStyle: FontStyle.italic,
                      ),
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
