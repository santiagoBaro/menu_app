import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/pages/onboarding_page.dart';
import 'package:menuapp/pages/tabbed_landing_page.dart';
import 'package:menuapp/pages/tabbed_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_types/data_types_export.dart';

void main() async {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'AvenirNextLTPro',
        primaryColor: Color(0xFFFF5578),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppBuilder(),
    );
  }
}

class AppBuilder extends StatefulWidget {
  AppBuilder({Key key}) : super(key: key);

  @override
  _AppBuilderState createState() => _AppBuilderState();
}

class _AppBuilderState extends State<AppBuilder> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    //autoLogIn();
    super.initState();
  }

  Future<Null> autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String foodioSpString = prefs.getString('foodio_sp');
    if (foodioSpString == null || foodioSpString == '') {
      storedUserCredentials = emptyUser;
      print('enterd string == null : ' +
          storedUserCredentials.isNewUser.toString());
    } else {
      Map foodioSpMap = jsonDecode(foodioSpString);
      storedUserCredentials = UserCredentials.fromJson(foodioSpMap);
    }
    return;
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('foodio_sp', logedOffUser.toJson().toString());

    setState(() {
      storedUserCredentials = logedOffUser;
    });
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('foodio_sp', nameController.text);

    setState(() {
      storedUserCredentials.setId('newId');
      storedUserCredentials.setNickname('newNickname');
      storedUserCredentials.setPassword('newPassword');
      storedUserCredentials.setToken('newToken');
      storedUserCredentials.recentlyViewed = List<LocalPointer>();
      storedUserCredentials.isNewUser = false;
    });

    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: autoLogIn(),
      builder: (BuildContext context, AsyncSnapshot<Null> snapshot) {
        if (storedUserCredentials == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (storedUserCredentials.getId() == "empty") {
          if (storedUserCredentials.isNewUser) {
            //* IF THE USER IS NEW
            return OnboardingPage();
          }
          //* IF IT IS NOT LOGGED IN, BUT NOT NEW
          return TabbedLoginPage();
        }
        //* IF IT IS LOGGED IN
        return TabbedLandingPage();
      },
    );
  }
}
