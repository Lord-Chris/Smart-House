import 'package:flutter/material.dart';
import 'package:smart_house/home.dart';
import 'package:smart_house/wifi_selection.dart';

import 'constants.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BEIGE,
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(40.0),
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
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  'Full Name',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: fieldDecor,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, top: 25),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: fieldDecor,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, top: 25),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: fieldDecor,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, top: 25),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 25,
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
              Padding(
                padding: EdgeInsets.only(bottom: 5.0, top: 25),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: BLUE,
                    fontSize: 25,
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
                  padding: EdgeInsets.all(40.0),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => WifiSelect()));
                    },
                    color: ORANGE,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: BEIGE,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

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
