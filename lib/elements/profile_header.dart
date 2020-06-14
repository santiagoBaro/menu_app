import 'package:flutter/material.dart';
import 'package:menuapp/tools/visual_assets.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String title;
  final String imageurl;
  final int amountOfRateings;
  final int averageRateingValue;
  final int pendingLocals;
  const ProfileHeader({
    Key key,
    @required this.name,
    @required this.title,
    @required this.imageurl,
    @required this.amountOfRateings,
    @required this.averageRateingValue,
    @required this.pendingLocals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //* BACKGROUND
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          colors: hotSand,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        //color: Colors.redAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              //* USER'S IMAGE
              radius: 60,
              backgroundColor: Colors.white24,
            ),
            Container(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //* USER'S NAME
                    name,
                    style: userNameTextStyle,
                  ),
                  Text(
                    //* USER'S TITLE
                    title,
                    style: userTitleTextStyle,
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    //* USERS VALUE
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      UsersValuesTag(
                        title: "rateings",
                        value: amountOfRateings.toString(),
                      ),
                      UsersValuesTag(
                        title: "avarege",
                        value: averageRateingValue.toString(),
                      ),
                      UsersValuesTag(
                        title: "pending",
                        value: pendingLocals.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsersValuesTag extends StatelessWidget {
  final String title;
  final String value;
  const UsersValuesTag({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title),
          Text(
            value,
            style: userValuesTextStyle,
          ),
        ],
      ),
    );
  }
}

TextStyle userNameTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.yellowAccent,
  fontWeight: FontWeight.bold,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(3.0, 3.0),
      blurRadius: 8.0,
      color: Colors.black45,
    ),
  ],
);

TextStyle userTitleTextStyle = TextStyle(
  color: Colors.white60,
  fontWeight: FontWeight.bold,
);

TextStyle userValuesTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);
