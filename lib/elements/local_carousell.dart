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
                LocalCarrousellElement(),
                LocalCarrousellElement(),
                LocalCarrousellElement(),
                LocalCarrousellElement(),
                LocalCarrousellElement(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
