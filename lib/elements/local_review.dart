import 'package:flutter/material.dart';

class LocalReview extends StatelessWidget {
  final String localImageUrl;
  final String localName;
  final String usersReview;
  const LocalReview({
    Key key,
    @required this.localImageUrl,
    @required this.localName,
    @required this.usersReview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        children: [
          Container(
            //* LOCAL'S IMAGE
            height: 100,
            width: 100,
            color: Colors.redAccent,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //* LOCALS NAME
                    localName,
                    style: titleTextStyle,
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    //* USER'S COMMENT
                    usersReview,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle titleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
