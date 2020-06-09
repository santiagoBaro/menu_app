import 'package:flutter/material.dart';
import 'local_carrousel_element.dart';

class LocalCarrousel extends StatelessWidget {
  final String title;
  const LocalCarrousel({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            //* TITLE
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SingleChildScrollView(
            //* LIST OF LOCALS
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                LocalCarrousellElement(
                  duration: 0.3,
                  price: "200",
                  rateing: 2.3,
                ),
                LocalCarrousellElement(
                  duration: 2,
                  price: "700",
                  rateing: 5,
                ),
                LocalCarrousellElement(
                  duration: 1,
                  price: "450",
                  rateing: 3.7,
                ),
                LocalCarrousellElement(
                  duration: 1.3,
                  price: "450",
                  rateing: 4.2,
                ),
                LocalCarrousellElement(
                  duration: 0.4,
                  price: "500",
                  rateing: 3.9,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
