import 'package:flutter/material.dart';
import 'package:menuapp/elements/local_carousell.dart';

class RecomendedPage extends StatelessWidget {
  const RecomendedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              margin: EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            LocalCarrousel(
              title: "Tus recomendados",
            ),
            LocalCarrousel(
              title: "Comida rapida",
            ),
            LocalCarrousel(
              title: "Pasta",
            ),
            LocalCarrousel(
              title: "Pizza",
            ),
            LocalCarrousel(
              title: "Salida romantica",
            ),
          ],
        ),
      ),
    );
  }
}
