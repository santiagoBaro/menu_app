import 'package:flutter/material.dart';
import 'package:menuapp/elements/recomended_carrousel_element.dart';

class LocalCarrousel extends StatelessWidget {
  final String title;
  const LocalCarrousel({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RecomendedCarrousellElement(),
                RecomendedCarrousellElement(),
                RecomendedCarrousellElement(),
                RecomendedCarrousellElement(),
                RecomendedCarrousellElement(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
