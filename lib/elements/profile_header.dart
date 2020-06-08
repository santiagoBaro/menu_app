import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              radius: 60,
              backgroundColor: Colors.white24,
            ),
            Container(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Cena",
                    style: userNameTextStyle,
                  ),
                  Text("food critique"),
                  Container(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("rateings"),
                      Text("avarege"),
                      Text("pending"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "45",
                        style: userValuesTextStyle,
                      ),
                      Text(
                        "4",
                        style: userValuesTextStyle,
                      ),
                      Text(
                        "8",
                        style: userValuesTextStyle,
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
