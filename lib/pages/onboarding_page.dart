import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 5000),
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
                    // ONBOARDING ILUSTRATIONS CARROUSELL
                    PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      children: <Widget>[
                        // FIRST PAGE
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
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

                        // SECOND PAGE
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
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
                                  "Now what you are ordering",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // THIRD PAGE
                        Stack(
                          children: <Widget>[
                            Center(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
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
                                  style: onboardingMessageTextStyle,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(15),
                                color: myAppTheme['AccentColor'],
                                textColor: myAppTheme['HighlightTextColor'],
                                onPressed: () {
                                  // BlocProvider.of<PersistedBloc>(context)
                                  //     .dispatch(SigningUpEvent());
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // CARROUSELL POSITION INICATOR
                    // Stack(
                    //   alignment: AlignmentDirectional.topStart,
                    //   children: <Widget>[
                    //     Container(
                    //       margin: const EdgeInsets.only(bottom: 35),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: <Widget>[
                    //           // CREATES DOTS, I = AMMOUNT OF PAGES
                    //           for (int i = 0; i < 3; i++)
                    //             (i == _currentPage)
                    //                 ? SlideDots(true)
                    //                 : SlideDots(false)
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),

              // LOGIN REDITECTION
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
                      // BlocProvider.of<PersistedBloc>(context)
                      //     .dispatch(LoginInEvent());
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
