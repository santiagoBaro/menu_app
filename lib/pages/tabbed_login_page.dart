import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menuapp/bloc/bloc/bloc/persisted_bloc.dart';
import 'package:menuapp/bloc/bloc/bloc/persisted_event.dart';
import 'package:menuapp/tools/visual_assets.dart';

class TabbedLoginPage extends StatefulWidget {
  TabbedLoginPage({Key key, this.initialIndex}) : super(key: key);
  int initialIndex;

  @override
  _TabbedLoginPageState createState() => _TabbedLoginPageState();
}

class _TabbedLoginPageState extends State<TabbedLoginPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        decoration: tabbedLoginHeaderBoxDecoration,
        child: Column(
          children: <Widget>[
            Container(
              width: screenWidth,
              color: myAppTheme['PrimaryBackgroundColor'],
              child: TabBar(
                controller: _nestedTabController,
                indicatorColor: myAppTheme['PrimaryColor'],
                labelColor: myAppTheme['AccentTextColor'],
                unselectedLabelColor: myAppTheme['SecondaryTextColor'],
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    text: "Login",
                  ),
                  Tab(
                    text: "SignUp",
                  ),
                ],
              ),
            ),
            Container(
              // THIS CONTAINER IS WHERE THE TAB DISPLAYS ITS PAGES
              color: myAppTheme['PrimaryBackgroundColor'],
              height: screenHeight * 0.5,
              child: TabBarView(
                controller: _nestedTabController,
                children: <Widget>[
                  Container(
                    // FIRST TAB PAGE
                    // LOGIN
                    child: LoginTab(),
                  ),
                  Container(
                    // SECOND TAB PAGE
                    // SIGNUP
                    child: SignUpTab(),
                  ),
                ],
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        width: screenWidth,
      ),
    );
  }
}

class LoginTab extends StatelessWidget {
  //const LoginTab({Key key}) : super(key: key);

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordContrller = TextEditingController();

    return Container(
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Login",
                style: titleTextStyle,
              ),
            ),
            // USERNAME TEXT FIELD
            Padding(
              padding: tabbedLoginPagging,
              child: TextFormField(
                controller: usernameController,
                style: onboardingMessageTextStyle,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: 'Username',
                  contentPadding: const EdgeInsets.all(15),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: tabbedLoginPagging,
              child: Row(
                children: <Widget>[
                  Expanded(
                    // PASSWORD TEXT FIELD
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextFormField(
                        controller: passwordContrller,
                        obscureText: true,
                        style: onboardingMessageTextStyle,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.all(15),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  // LOGIN BUTTON
                  FlatButton(
                    child: Text(
                      'Login',
                      style: onboardingMessageTextStyle,
                    ),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: myAppTheme['PrimaryActionButtonColor'],
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(15),
                    textColor: myAppTheme['PrimaryActionButtonColor'],
                    onPressed: () {
                      if (_loginFormKey.currentState.validate()) {
                        BlocProvider.of<PersistedBloc>(context).dispatch(
                          LogInEvent(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // LOGIN WITH GOOGLE BUTTON
            FlatButton(
              color: Colors.black,
              onPressed: () {},
              child: Text(
                "Login With Google",
                style: hilightTextStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpTab extends StatelessWidget {
  //const SignUpTab({Key key}) : super(key: key);

  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordContrller = TextEditingController();
    final passwordCheckContrller = TextEditingController();
    final emailController = TextEditingController();
    return Container(
      child: Form(
        key: _signupFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "SignUp",
                  style: titleTextStyle,
                ),
              ),
              // USERNAME TEXT FIELD
              Padding(
                padding: tabbedLoginPagging,
                child: TextFormField(
                  controller: usernameController,
                  style: onboardingMessageTextStyle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Username',
                    contentPadding: const EdgeInsets.all(15),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // EMAIL TEXT FIELD
              Padding(
                padding: tabbedLoginPagging,
                child: TextFormField(
                  controller: emailController,
                  style: onboardingMessageTextStyle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.all(15),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      //TODO improve email validation logic
                      return 'Please enter your e-mail';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: tabbedLoginPagging,
                child: TextFormField(
                  controller: passwordContrller,
                  obscureText: true,
                  style: onboardingMessageTextStyle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.all(15),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      //TODO : improve password ckeck logic
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: tabbedLoginPagging,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // PASSWORD TEXT FIELD
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          controller: passwordCheckContrller,
                          obscureText: true,
                          style: onboardingMessageTextStyle,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Retype Password',
                            contentPadding: const EdgeInsets.all(15),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Type your password again';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    // LOGIN BUTTON
                    FlatButton(
                      child: Text(
                        'SignUp',
                        style: onboardingMessageTextStyle,
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: myAppTheme['PrimaryActionButtonColor'],
                            width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(15),
                      textColor: myAppTheme['PrimaryActionButtonColor'],
                      onPressed: () {
                        if (_signupFormKey.currentState.validate()) {
                          BlocProvider.of<PersistedBloc>(context).dispatch(
                            SigunUpEvent(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // SIGNUP WITH GOOGLE BUTTON
              FlatButton(
                color: Colors.black,
                onPressed: () {},
                child: Text(
                  "SingUp With Google",
                  style: hilightTextStyle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
