import 'package:flutter/material.dart';

class LocalReview extends StatelessWidget {
  const LocalReview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.redAccent,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "sit est non",
                    style: titleTextStyle,
                  ),
                  Text(
                      "Unde itaque sit optio ad magni pariatur. Ut ex et delectus. Tempora deserunt omnis ducimus saepe ad iure. Nihil expedita quae aut labore est.")
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
