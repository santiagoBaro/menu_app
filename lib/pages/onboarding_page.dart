import 'package:gooey_carousel/gooey_carrousel.dart';
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
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    //
    storedUserCredentials = logedOffUser;
    saveUserCredentials();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: myAppTheme['PrimaryBackgroundColor'],
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    //* ONBOARDING ILUSTRATIONS CARROUSELL
                    GooeyCarousel(
                      // scrollDirection: Axis.horizontal,
                      // controller: _pageController,
                      // onPageChanged: _onPageChanged,
                      children: <Widget>[
                        //* FIRST PAGE
                        Stack(
                          children: <Widget>[
                            Container(color: Colors.grey[100]),
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
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 320.0,
                                  bottom: 20,
                                  right: 20,
                                ),
                                child: Text(
                                  "Find New Spots",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 500.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ActiveIndicator(),
                                    InactiveIndicator(),
                                    InactiveIndicator(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        //* SECOND PAGE
                        Stack(
                          children: <Widget>[
                            Container(color: Colors.grey[200]),
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
                                padding: const EdgeInsets.only(top: 360.0),
                                child: Text(
                                  "Know what you are ordering",
                                  style: onboardingTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 500.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InactiveIndicator(),
                                    ActiveIndicator(),
                                    InactiveIndicator(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        //* THIRD PAGE
                        Stack(
                          children: <Widget>[
                            Container(color: Colors.grey[100]),
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
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 500.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InactiveIndicator(),
                                    InactiveIndicator(),
                                    ActiveIndicator(),
                                  ],
                                ),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveIndicator extends StatelessWidget {
  const ActiveIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.trip_origin,
            color: Colors.blueGrey[200],
            size: 30,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Icon(
              Icons.brightness_1,
              color: Colors.blueGrey,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class InactiveIndicator extends StatelessWidget {
  const InactiveIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(
        Icons.trip_origin,
        color: Colors.blueGrey[200],
        size: 30,
      ),
    );
  }
}
