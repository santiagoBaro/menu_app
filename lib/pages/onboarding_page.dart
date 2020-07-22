import 'dart:async';

import 'package:flutter/material.dart';
import 'package:menuapp/data_types/data_types_export.dart';
import 'package:menuapp/pages/tabbed_login_page.dart';
import 'package:menuapp/tools/visual_assets.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    //
    storedUserCredentials = logedOffUser;
    saveUserCredentials();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 2000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: myAppTheme['PrimaryBackgroundColor'],
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    //* ONBOARDING ILUSTRATIONS CARROUSELL
                    PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      children: <Widget>[
                        //* FIRST PAGE
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child:
                                      Image.asset('assets/images/unboxing.png'),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 300.0),
                                child: Text(
                                  "Find New Spots",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),

                        //* SECOND PAGE
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: Image.asset(
                                      'assets/images/reading-side.png'),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 300.0),
                                child: Text(
                                  "Know what you are ordering",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),

                        //* THIRD PAGE
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 500),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 100.0),
                                  child: Image.asset(
                                      'assets/images/ice-cream.png'),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 300.0),
                                child: Text(
                                  "Your next favourite food is out there",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: MediaQuery.of(context).size.height * 0.1,
                              left:
                                  MediaQuery.of(context).size.width * 0.5 - 80,
                              width: 120,
                              child: RaisedButton(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: myAppTheme['HighlightTextColor'],
                                    fontSize: 20,
                                    shadows: [
                                      textShadow,
                                      textHilight,
                                    ],
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(15),
                                color: myAppTheme['AccentColor'],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TabbedLoginPage(
                                        initialIndex: 1,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //* LOGIN REDITECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account?',
                    style: onboardingMessageTextStyle,
                  ),
                  FlatButton(
                    child: Text(
                      'Login',
                      style: onboardingMessageTextStyle,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabbedLoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
