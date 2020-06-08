import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

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
        color: Colors.redAccent,
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
                    "John Cena",
                    style: userNameTextStyle,
                  ),
                  Text(
                    //* USER'S TITLE
                    "food critique",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
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
                        value: "45",
                      ),
                      UsersValuesTag(
                        title: "avarege",
                        value: "4",
                      ),
                      UsersValuesTag(
                        title: "pending",
                        value: "8",
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
);

TextStyle userTitleTextStyle = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);

TextStyle userValuesTextStyle = TextStyle(
  fontSize: 30,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);
