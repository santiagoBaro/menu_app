import 'package:flutter/material.dart';
import 'package:menuapp/tools/visual_assets.dart';

class AvailabilityTab extends StatelessWidget {
  const AvailabilityTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 175,
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 1,
              color: Colors.black38,
              margin: EdgeInsets.only(bottom: 20),
            ),
            Text(
              "Hours",
              style: onboardingTextStyle,
            ),
            Container(
              height: 1,
              color: Colors.black38,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Monday",
                  style: titleText,
                ),
                Text("Closed"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tuesday",
                  style: titleText,
                ),
                Text("10 - 6"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wednesday",
                  style: titleText,
                ),
                Text("10 - 7"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Thursday",
                  style: titleText,
                ),
                Text("10 - 8"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Friday",
                  style: titleText,
                ),
                Text("10 - 8"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Saturday",
                  style: titleText,
                ),
                Text("9 - 5"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sunday",
                  style: titleText,
                ),
                Text("Closed"),
              ],
            ),
            Container(
              height: 1,
              color: Colors.black38,
              margin: EdgeInsets.symmetric(vertical: 20),
            ),
            Text(
              "Special cases:",
              style: titleText,
            ),
            Text("January 1,6"),
            Text("May 1"),
            Text("June 19"),
            Text("July 18"),
            Text("August 25"),
            Text("November 2"),
            Text("December 25"),
          ],
        ),
      ),
    );
  }
}

TextStyle titleText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
