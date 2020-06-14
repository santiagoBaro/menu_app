import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menuapp/pages/explore_page.dart';
import 'package:menuapp/pages/onboarding_page.dart';
import 'package:menuapp/pages/profile_page.dart';
import 'package:menuapp/pages/recomended_page.dart';
import 'package:menuapp/pages/search_page.dart';
import 'package:menuapp/pages/tabbed_landing_page.dart';
import 'package:menuapp/pages/tabbed_login_page.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:menuapp/bloc/bloc/bloc/persisted_bloc.dart';
import 'package:menuapp/bloc/bloc/bloc/persisted_state.dart';

import 'bloc/bloc/bloc/persisted_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppsBuilder(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ExplorePage(),
    SearchPage(),
    RecomendedPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Recomended'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.black38,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AppsBuilder extends StatelessWidget {
  const AppsBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) => PersistedBloc(),
        child: Container(
          child: BlocBuilder<PersistedBloc, PersistedState>(
            builder: (BuildContext context, PersistedState state) {
              if (state is InitialState) {
                //
                return buildOnboardingPage();
              } else if (state is LoadingState) {
                //
                return buildLoading();
              } else if (state is LogedState) {
                //
                return buildTabbedLandingPage();
              } else if (state is NotLogedState) {
                //
                return buildLoginPage();
              } else if (state is RegistrateringState) {
                //
                return buildLoginPage();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildOnboardingPage() {
    return OnboardingPage();
  }

  Widget buildLoading() {
    return Column(
      children: <Widget>[
        Text(
          'Getting your information',
          style: TextStyle(
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget buildTabbedLandingPage() {
    return TabbedLandingPage();
  }

  Widget buildLoginPage() {
    return TabbedLoginPage();
  }
}
