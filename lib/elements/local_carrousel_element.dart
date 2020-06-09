import 'package:flutter/material.dart';

class LocalCarrousellElement extends StatelessWidget {
  final double rateing;
  final double duration;
  final String price;
  const LocalCarrousellElement({
    Key key,
    @required this.rateing,
    @required this.duration,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //* CARROUSELL CARD
      height: 120,
      width: 150,
      margin: EdgeInsets.all(15),
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
            //* CARD IMAGE
            height: 80,
          ),
          Container(
            //* CARD'S FOOTER
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
                  //* RATEING'S ICON
                  Icons.star,
                  color: Colors.yellow,
                  size: 16,
                ),
                Text(
                  //* RATEINGS VALUE
                  // shows the avarage rateing
                  rateing.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(width: 2),
                Container(
                  //* FIRST SEPARATOR
                  height: 30,
                  width: 1,
                  color: Colors.black12,
                ),
                Icon(
                  //* DURATION'S ICON
                  Icons.timer,
                  color: Colors.yellow,
                  size: 16,
                ),
                Text(
                  //* DURATION'S VALUE
                  // shows the avarage customar stay
                  "${duration}h",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(width: 2),
                Container(
                  //* SECOND SEPARATOR
                  height: 30,
                  width: 1,
                  color: Colors.black12,
                ),
                Icon(
                  //* PRICE ICON
                  Icons.attach_money,
                  color: Colors.yellow,
                  size: 16,
                ),
                Text(
                  //* PRICE VALUE
                  // shows the locals avarage cost per person
                  price,
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
