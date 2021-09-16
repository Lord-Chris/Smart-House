import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/login.dart';
import 'package:smart_house/wifi_selection.dart';

import 'constants.dart';
import 'scroll_column_expandable.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.all(20),
        child: ScrollColumnExpandable(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blueAccent,
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.roofing,
                        color: WHITE,
                        size: 40,
                      ),
                      Text(
                        'Smart Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: fieldDecor.copyWith(
                        hintText: 'Full Name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: fieldDecor.copyWith(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      decoration: fieldDecor.copyWith(
                        hintText: 'Phone Number',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: fieldDecor.copyWith(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045),
                    TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: fieldDecor.copyWith(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WifiSelect()));
                          },
                          color: Colors.blueAccent,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Center(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: BLUE,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
