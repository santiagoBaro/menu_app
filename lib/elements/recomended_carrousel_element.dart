import 'package:flutter/material.dart';

class RecomendedCarrousellElement extends StatelessWidget {
  // final String timeValue;
  // final String starValue;
  // final String priceValue;
  // final IconData typeIcon;
  const RecomendedCarrousellElement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 150,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
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
      child: Column(
        children: [
          Container(
            height: 80,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 2),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 16,
                ),
                Text(
                  // shows the avarage rateing
                  "4",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(width: 2),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.timer,
                  color: Colors.yellow,
                  size: 16,
                ),
                Text(
                  // shows the avarage customar stay
                  "1h",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(width: 2),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.attach_money,
                  color: Colors.yellow,
                  size: 16,
                ),
                Text(
                  // shows the locals avarage cost per person
                  "450",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(width: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
